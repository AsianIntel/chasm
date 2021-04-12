module Component {
    class Component {
        type t;

        var dims: domain(string);

        var dom: domain;
        var array: [dom] t;
        // Change this to a units library later on
        var unit: string;

        proc init(type t, array: [] t, dims: domain(string), unit: string) {
            this.t = t;

            this.dims = dims;

            this.dom = array.domain;
            this.array = array;

            this.unit = unit;
        }

        proc dimensions() const ref {
            return this.dims;
        }

        proc dimension(dim: string) {
            //writeln(this.dims(dim));
        }

        proc unit() const ref {
            return this.unit;
        }

        proc values() const ref {
            return this.array;
        }
    }
}