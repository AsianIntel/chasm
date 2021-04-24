module DataArray {
    enum DType {
        Int64,
        Float64,
        Bool,
        String
    }

    class AbstractDataArray {
        var data_type: DType;

        proc toDataArray() {
            select data_type {
                when DType.Int64 do return try! this :borrowed DataArray(int(64));
                when DType.Float64 do return try! this :borrowed DataArray(real(64));
                when DType.Bool do return try! this :borrowed DataArray(bool);
                when DType.String do return try! this :borrowed DataArray(string);
            }
        }
    }

    class DataArray: AbstractDataArray {
        type eltType;

        var dom: domain;
        var arr: [dom] eltType;

        proc init(type eltType, ref arr: [] eltType) {
            super.init(getDType(eltType));
            this.eltType = eltType;
            this.dom = arr.domain;
            this.arr = arr;
        }
    }

    proc getDType(type value) param {
        if isSubtype(value, int(64)) {
            return DType.Int64;
        } else if isSubtype(value, real(64)) {
            return DType.Float64;
        } else if isSubtype(value, bool) {
            return DType.Bool;
        } else if isSubtype(value, string) {
            return DType.String;
        }
        halt("Only the following types are supported: int(64), real(64), bool, string");
    }
}
