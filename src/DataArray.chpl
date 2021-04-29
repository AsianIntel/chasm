module DataArray {
    enum Dtype {Int64, Real64, Bool, String};

    proc toDtype(type t) {
        select t {
            when int do
                return Dtype.Int64;
            when real do 
                return Dtype.Real64;
            when bool do 
                return Dtype.Bool;
            when string do 
                return Dtype.String;
            otherwise
                compilerError("only int, real, bool and string types are supported");

        }
    }
    
    class AbstractDataArray {
        var dataArrayType: Dtype;
        const arrRank: int;

        proc init(type t, r: int) {
            this.dataArrayType = toDtype(t);
            this.arrRank = r;

        }   

        proc _str_() {
            //halt here
            writeln("This is the generic abstractDataArray class");

        }
        

        
    }

    class DataArray: AbstractDataArray {
        type eltType;
        param rank: int;
        param stridable: bool;

        var dom: domain(rank, stridable = stridable);
        var arr: [dom] eltType;

        var dimensions: domain(string);

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

        override proc _str_() {
            writeln("DataArray instance of type\n", eltType:string);
            writeln("\nvalue\n", arr);
            writeln("\ndimensions\n", dimensions, "\n");      
            
        }
                
    }
}
