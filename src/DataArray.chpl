module DataArray {
    class DataArray {
        type t;
        var dom: domain;
        var arr: [dom] t;

        var dimension_domain: domain(string);
        var dim: [dimension_domain] int;

        var unit: string;

        proc init(type t, arr: [] t, dim: domain(string), unit: string) {
            this.t = t;                      
            this.dom = arr.domain;
            this.arr = arr;

            var dims: [dim] int;
            var i = 0;
            for dimension in dim do {
                dims[dimension] = i;
                i = i + 1; 
            }            
            this.dimension_domain = dim;
            this.dim = dims;
            this.unit = unit;
        }

        operator +(lhs: DataArray, rhs: DataArray) {
            assert(lhs.unit == rhs.unit);

            var result = lhs.arr + rhs.arr;
            var resultDimensions = lhs.dimension_domain;            
            return new DataArray(lhs.t, result, resultDimensions, lhs.unit);
        }

        operator -(ref lhs: DataArray, rhs: DataArray) {
            assert(lhs.unit == rhs.unit);

            var result = lhs.arr - rhs.arr;
            var resultDimensions = lhs.dimension_domain;            
            return new DataArray(lhs.t, result, resultDimensions, lhs.unit);
        }

        proc dims() const ref {
            return this.dim;
        }

        proc dims(dimension: string) const {
            var idx = this.dims[dimension];
            return idx;
        }

        proc units() const ref {
            return this.unit;
        }

        proc values() const ref {
            return this.arr;

        }
    }
}
