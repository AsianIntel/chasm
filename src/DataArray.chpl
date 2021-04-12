module DataArray {
    class DataArray {
        type t;
        var dom: domain;
        var arr: [dom] t;
        var dim: domain(string);
        var unit: string;

        proc init(type t, arr: [] t, dim: domain(string), unit: string) {
            this.t = t;                      
            this.dom = arr.domain;
            this.arr = arr;                       
            this.dim = dim;
            this.unit = unit;

        }

        operator +(lhs: DataArray, rhs: DataArray) {
            var result = lhs.arr + rhs.arr;
            var resultDimensions = lhs.dim;            
            return new DataArray(lhs.t, result, resultDimensions, lhs.unit);
        }

        operator -(lhs: DataArray, rhs: DataArray) {
            var result = lhs.arr - rhs.arr;
            var resultDimensions = lhs.dim;            
            return new DataArray(lhs.t, result, resultDimensions, lhs.unit);
        }

        proc dims() const ref {
            return this.dim;

        }

        proc units() const ref {
            return this.unit;
        }

        proc values() const ref {
            return this.arr;

        }


    }
    
    

}