module Properties {
    private use marker;

    class AbstractProperties {}

    class Properties: AbstractProperties {
        var unit: UnitMarker;
        var dims: domain(string);    

        proc init(labels: domain(string), unit: UnitMarker) {            
            this.unit = unit;
            this.dims = labels;                      
        }
    }
}