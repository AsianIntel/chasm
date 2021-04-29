module DataArray {
    enum DType {Int64, Real64, Bool, String};

    proc toDType(type t) {
        select t {
            when int do
                return DType.Int64;
            when real do 
                return DType.Real64;
            when bool do 
                return DType.Bool;
            when string do 
                return DType.String;
            otherwise
                compilerError("only int, real, bool and string types are supported");
        }
    }
    
    class AbstractDataArray {
        var d_type: DType;
        const rank: int;

        proc init(type d_type, rank: int) {
            this.d_type = toDType(d_type);
            this.rank = rank;
        }   

        proc print() {
            halt("Virtual Print method");
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
            super.init(eltType, size.rank);
            this.eltType = eltType;
            this.rank = size.rank;
            this.stridable = size.stridable;
            this.dom = size;

            var arr: [size] eltType;
            this.arr = arr;

            this.dimensions = dimensions;
        }

        proc init(type eltType, size: domain, dimensions: domain(string), default_value: eltType) {
            super.init(eltType, size.rank);
            this.eltType = eltType;
            this.rank = size.rank;
            this.stridable = size.stridable;
            this.dom = size;

            var arr: [size] eltType = default_value;
            this.arr = arr;

            this.dimensions = dimensions;
        }

        proc init(type eltType, ref arr: [] eltType, dimensions: domain(string)) {
            super.init(eltType, arr.domain.rank);
            this.eltType = eltType;
            this.rank = arr.domain.rank;
            this.stridable = arr.domain.stridable;
            this.dom = arr.domain;
            this.arr = arr;
            this.dimensions = dimensions;
        }

        override proc print() {
            writeln(this);
        }
    }
}
