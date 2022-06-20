module Properties {
    private use marker;

    class AbstractProperties {
        var dims: domain(string);

        proc init(labels: domain(string)) {
            this.dims = labels;
        }
    }

    class Properties: AbstractProperties {
        var unit: UnitMarker;
        var dims: domain(string);    

        proc init(labels: domain(string), unit: UnitMarker) {
            super.init(labels);
            this.unit = unit;
            this.dims = labels;                      
        }
    }
}