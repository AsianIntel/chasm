module Properties {
    private use marker;

    class Properties {
        var unit: UnitMarker;
        var dims: domain(string);    

        proc init(labels: domain(string), unit: UnitMarker) {
            this.unit = unit;
            this.dims = labels;                      
        }
    }
}