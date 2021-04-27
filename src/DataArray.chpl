module DataArray {
    class AbstractDataArray {
        param rank: int;
        param stridable: bool;

        proc toDataArray(type eltType) {
            return try! this :borrowed DataArray(eltType, rank = rank, stridable = stridable);
        }
    }

    class DataArray: AbstractDataArray {
        type eltType;
        param rank: int;
        param stridable: bool;

        var dom: domain(rank, stridable = stridable);
        var arr: [dom] eltType;

        var dimensions: domain(string);

        proc init(type eltType, size: domain, dimensions: domain(string)) {
            super.init(size.rank, size.stridable);
            this.eltType = eltType;
            this.rank = size.rank;
            this.stridable = size.stridable;
            this.dom = size;

            var arr: [size] eltType;
            this.arr = arr;
            
            this.dimensions = dimensions;
        }

        proc init(type eltType, ref arr: [] eltType, dimensions: domain(string)) {
            super.init(arr.domain.rank, arr.domain.stridable);
            this.eltType = eltType;
            this.rank = arr.domain.rank;
            this.stridable = arr.domain.stridable;
            this.dom = arr.domain;
            this.arr = arr;
            this.dimensions = dimensions;
        }
    }
}
