module Stepper {
    import Math;
    use List;
    use Map;
    use State;
    use Properties;
    use DataArray;
    use Components;
    use marker;

    class Stepper {
        var input_properties: map(string, shared AbstractProperties);
        var tendency_properties: map(string, shared AbstractProperties);
        var diagnostic_properties: map(string, shared AbstractProperties);
        
        proc init(input_properties: map(string, shared AbstractProperties), tendency_properties: map(string, shared AbstractProperties), diagnostic_properties: map(string, shared AbstractProperties)) {
            this.input_properties = input_properties;
            this.tendency_properties = tendency_properties;
            this.diagnostic_properties = diagnostic_properties;
        }

        proc call(state: State, timestep: real) {
            halt("Stepper doesn't implement call");
        }
    }

    class AdamsBashforth: Stepper {
        var order: int;
        var component_list;
        var tendencies_list: list(map(string, shared AbstractDataArray));

        proc init(in component_list, order: int = 3) {
            super.init(new map(string, shared AbstractProperties), new map(string, shared AbstractProperties), new map(string, shared AbstractProperties));
            this.order = order;
            this.component_list = component_list;
            this.tendencies_list = new list(map(string, shared AbstractDataArray));
        }

        proc call(state: State, timestep: real) {
            var tendencies = new map(string, shared AbstractDataArray);
            var diagnostics = new map(string, shared AbstractDataArray);
            for component in this.component_list {
                if (isSubtype(component.type, ImplicitTendencyComponent)) {
                    var (tendency, diagnostic) = component.array_call(state, timestep);
                    add_maps(tendencies, tendency);
                    diagnostics.extend(diagnostic);
                } else if (isSubtype(component.type, TendencyComponent)) {
                    var (tendency, diagnostic) = component.array_call(state);
                    add_maps(tendencies, tendency);
                    diagnostics.extend(diagnostic);
                }
            }
            convert_tendency_units(tendencies);
            this.tendencies_list.append(tendencies);

            var new_state = this.perform_step(state, timestep);
            if this.tendencies_list.size == this.order {
                this.tendencies_list.pop(0);
            }

            return (diagnostics, new_state);
        }

        proc perform_step(state: State, timestep: real) {
            var order = Math.min(this.order, this.tendencies_list.size);
            if order == 1 {
                var new_state = step_forward_euler(state, this.tendencies_list.last(), timestep);
                return new_state;
            }
        }
    }

    proc add_maps(map1: map(string, shared AbstractDataArray), map2: map(string, shared AbstractDataArray)) {
        for (k, v) in map2.items() {
            if !map1.contains(k) {
                map1.add(k, v);
            } else {
                var existing = map1.getValue(k);
                map1.set(k, (existing + v): shared AbstractDataArray);
            }
        }
    }

    proc convert_tendency_units(tendencies: map(string, shared AbstractDataArray)) {
        // for t in tendencies.values() {
        //     var marker = t.getMarker();
        //     var newMarker = new UnitMarker(marker.length, marker.mass, marker.time - 1, marker.electric_current, marker.temperature, marker.substance, marker.luminous_intensity, marker.coefficient, marker.constant, marker.symbol + "s^-1");
        //     t.setMarker(newMarker);
        // }
    }

    proc step_forward_euler(state: State, tendencies, timestep: real) {
        var return_state = new State();
        for key in tendencies.keys() {
            var res = state.getValue(key) + timestep * tendencies.getValue(key);
            return_state.add(key, res: shared AbstractDataArray);
        }
        return return_state;
    }

    proc second_bashforth(state: State, tendencies_list, timestep: real) {
        var return_state = new State();
        var t_size = tendencies_list.size;
        for key in tendencies_list[0].keys() {
            return_state.add(key, state.getValue(key) + timestep * (1.5 * tendencies_list[t_size-1][key] - 0.5 * tendencies_list[t_size-2][key]));
        }
        return return_state;
    }

    proc third_bashforth(state: State, tendencies_list, timestep: real) {
        var return_state = new State();
        var t_size = tendencies_list.size;
        for key in tendencies_list[0].keys() {
            return_state.add(
                key, 
                state.getValue(key) + timestep * (
                    23.0/12 * tendencies_list[t_size-1][key] - 4.0/3 * tendencies_list[t_size-2][key] + 5.0/12 * tendencies_list[t_size-3][key]
                )
            );
        }
        return return_state;
    }

    proc fourth_bashforth(state: State, tendencies_list, timestep: real) {
        var return_state = new State();
        var t_size = tendencies_list.size;
        for key in tendencies_list[0].keys() {
            return_state.add(
                key, 
                state.getValue(key) + timestep * (
                    55.0/24 * tendencies_list[t_size-1][key] - 
                    59.0/24 * tendencies_list[t_size-2][key] + 
                    37.0/24 * tendencies_list[t_size-3][key] -
                    3.0/8 * tendencies_list[t_size-4][key]
                )
            );
        }
        return return_state;
    }

    proc copy_untouched_quantities(old_state: State, new_state: State) {
        for (key, value) in old_state.items() {
            if !new_state.contains(key) {
                new_state.add(key, value);
            }
        }
    }
}