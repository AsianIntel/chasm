module Properties {
    private use marker;
    private use DataArray;

    class AbstractProperties {
        proc getDims(): domain(string) {
            halt("AbstractProperties doesn't implement getDims");
        }

        proc getMarker(): AbstractUnitMarker {
            halt("AbstractProperties doesn't implement getMarker");
            return new AbstractUnitMarker();
        }

        proc intoDataArray1(): DataArray1 {
           halt("AbstractProperties doesn't implement intoDataArray1");
        }
    }

    class Properties: AbstractProperties {
        var marker: UnitMarker;
        var dims: domain(string);    

        proc init(labels: domain(string), marker: UnitMarker) {
            super.init();
            this.marker = marker;
            this.dims = labels;                      
        }

        override proc getDims(): domain(string) {
            return this.dims;
        }

        override proc getMarker(): AbstractUnitMarker {
            return this.marker;
        }
    }
}