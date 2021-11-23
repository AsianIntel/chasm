module Components {
    class InputProperties {
        var unit: string;
        var dims_dom: domain;
        var dims: [dims_dom] string;
        var name: string;

        proc init(unit: string, dims, name: string) {
            this.unit = unit;
            this.dims_dom = dims.domain;
            this.dims = dims;
            this.name = name;
        }
    }

    class TendencyComponent {
        var input_properties;

        proc init(in input_properties) {
            this.input_properties = input_properties;
        }
    }
}