module DataArray {
    private use SI;

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

        proc _op(opt: string, lhs): owned AbstractDataArray {
            halt("Pure virtual method");
        }

        proc add(rhs: borrowed AbstractDataArray): owned AbstractDataArray {
            halt("Pure virtual method");
        }

        proc subtract(rhs: borrowed AbstractDataArray): owned AbstractDataArray {
            halt("Pure virtual method");
        }

        proc toUnits(newUnits: borrowed Quantity): owned AbstractDataArray {
            halt("Pure virtual method");
        }
        
    }

    class DataArray: AbstractDataArray {
        type eltType;
        param rank: int;
        param stridable: bool;

        var dom: domain(rank, stridable = stridable);
        var arr: [dom] eltType;

        var dimensions: domain(string);
        var quantity: Quantity;

        proc init(type eltType, size: domain, dimensions: domain(string), quantity: Quantity) {
            super.init(eltType, size.rank);
            this.eltType = eltType;
            this.rank = size.rank;
            this.stridable = size.stridable;
            this.dom = size;

            var arr: [size] eltType;
            this.arr = arr;

            this.dimensions = dimensions;
            this.quantity = quantity;
        }

        proc init(type eltType, size: domain, dimensions: domain(string), quantity: borrowed Quantity, default_value: eltType) {
            super.init(eltType, size.rank);
            this.eltType = eltType;
            this.rank = size.rank;
            this.stridable = size.stridable;
            this.dom = size;

            var arr: [size] eltType = default_value;
            this.arr = arr;

            this.dimensions = dimensions;
            this.quantity = quantity;
        }

        proc init(type eltType, ref arr: [] eltType, dimensions: domain(string), quantity: borrowed Quantity) {
            super.init(eltType, arr.domain.rank);
            this.eltType = eltType;
            this.rank = arr.domain.rank;
            this.stridable = arr.domain.stridable;
            this.dom = arr.domain;
            this.arr = arr;
            this.dimensions = dimensions;
            this.quantity = quantity;
        }
        

        override proc print() {
            writeln(this);
        }

        override proc _op(opt: string, lhs: borrowed DataArray): owned AbstractDataArray where this.rank == lhs.rank {
            var rhs: borrowed DataArray = this;
            
            if (lhs.quantity != rhs.quantity) {
                halt("Quantities are not same");
            }

            var scale = rhs.quantity.toBaseUnit() / lhs.quantity.toBaseUnit();
            select opt {
                when "+" {
                    var arr = lhs.arr + scale * rhs.arr;
                    return new owned DataArray(arr.eltType, arr, lhs.dimensions, lhs.quantity);
                }
                when "-" { 
                    var arr = lhs.arr - scale * rhs.arr;
                    return new owned DataArray(arr.eltType, arr, lhs.dimensions, lhs.quantity);
                }
                otherwise {
                    halt("Unsupported operation on DataArray");
                }
            }
        }

        override proc add(rhs: borrowed AbstractDataArray): owned AbstractDataArray {
            return rhs._op("+", this);
        }

        override proc subtract(rhs: borrowed AbstractDataArray): owned AbstractDataArray {
            return rhs._op("-", this);
        }

        override proc toUnits(newUnits: borrowed Quantity): owned AbstractDataArray {
            if (this.quantity == newUnits) {
                var scale = this.quantity.toBaseUnit() / newUnits.toBaseUnit();
                var arr = scale * this.arr;
                return new owned DataArray(arr.eltType, arr, this.dimensions, newUnits);                
                
            } else {
                halt("Quantities are not same");
            }           
        }
    }

    operator +(lhs: borrowed AbstractDataArray, rhs: borrowed AbstractDataArray): owned AbstractDataArray {
        return lhs.add(rhs);
    }

    operator -(lhs: borrowed AbstractDataArray, rhs: borrowed AbstractDataArray): owned AbstractDataArray {
        return lhs.subtract(rhs);
    }
}
