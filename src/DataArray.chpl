module DataArray {
    private use unit;
    private use marker;
    pragma "no doc"
    enum DType {Int64, Real64, Bool, String, Undefined};

    pragma "no doc"
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
                return DType.Undefined;
        }
    }

    class AbstractDataArray {
        pragma "no doc"
        var d_type: DType;

        pragma "no doc"
        const rank: int;

        pragma "no doc"
        proc init(type d_type, rank: int) {
            this.d_type = toDType(d_type);
            this.rank = rank;
        }

        pragma "no doc"
        proc _add(lhs): owned AbstractDataArray {
            halt("Pure virtual method");
        }

        proc add(rhs: borrowed AbstractDataArray): owned AbstractDataArray {
            halt("Pure virtual method");
        }

        pragma "no doc"
        proc _subtract(lhs): owned AbstractDataArray {
            halt("Pure virtual method");
        }

        proc subtract(rhs: borrowed AbstractDataArray): owned AbstractDataArray {
            halt("Pure virtual method");
        }

        proc multiply(rhs: real): owned AbstractDataArray {
            halt("Pure virtual method");
        }

        pragma "no doc"
        proc _eq(lhs): bool {
            halt("Pure virtual method");
        }

        proc eq(rhs: borrowed AbstractDataArray): bool {
            halt("Pure virtual method");
        }

        pragma "no doc"
        proc convertTo(type to_convert): owned AbstractDataArray {
            halt("Pure virtual method");
        }

        pragma "no doc"
        proc convertTendencyUnit() {
            halt("Pure virtual method");
        }

        proc getDomShape(): 3*int {
            halt("AbstractDataArray doesn't implement getDomShape");
        }
    }

    /*
    A DataArray is a container over an array with additional support for dimension labels for each axis of the array.
    */
    class DataArray1: AbstractDataArray {
        /* The type of elements contained in the DataArray. */
        type eltType;

        /* The domain of the Chapel array owned by the DataArray.
           Refer to `the Chapel docs <https://chapel-lang.org/docs/primers/domains.html>`_ for more information on domains. 
        */
        var dom: domain(1, stridable = false);
        var arr: [dom] eltType;

        /* An index space indicating the labels for each of the axis of the array owned by the DataArray. */
        var dimensions: domain(string);
        var units: UnitMarker;       

        /* Initializes a DataArray with the given array. */
        proc init(in arr, dimensions: domain(string), unitMark: UnitMarker) {
            super.init(arr.eltType, arr.domain.rank);
            this.eltType = arr.eltType;
            this.dom = arr.domain;

            this.arr = arr;

            this.dimensions = dimensions;
            this.units = unitMark;
        }

        pragma "no doc"
        override proc _add(lhs: borrowed DataArray1): owned AbstractDataArray where isOperable(lhs, this) {
            var rhs: borrowed DataArray1 = this;
            var lhsUnitArr = new unit_array(lhs.units, lhs.arr);
            var rhsUnitArr = new unit_array(rhs.units, rhs.arr);            
            var res = lhsUnitArr + rhsUnitArr;
            return new owned DataArray1(res.arr, lhs.dimensions, lhs.units);
        }

        /* Utility method to add two ``DataArray``. 
        
          **Note**: This can be chained with other operators. 
        */
        override proc add(rhs: borrowed AbstractDataArray): owned AbstractDataArray {
            return rhs._add(this);
        }

        pragma "no doc"
        override proc _subtract(lhs: borrowed DataArray1): owned AbstractDataArray where isOperable(lhs, this) {
            var rhs: borrowed DataArray1 = this;
            var lhsUnitArr = new unit_array(lhs.units, lhs.arr);
            var rhsUnitArr = new unit_array(rhs.units, rhs.arr);
            var res = lhsUnitArr - rhsUnitArr;
            return new owned DataArray1(res.arr, lhs.dimensions, lhs.units);
        }

        /* Utility method to subtract two ``DataArray``. 
        
          **Note**: This can be chained with other operators. 
        */
        override proc subtract(rhs: borrowed AbstractDataArray): owned AbstractDataArray {
            return rhs._subtract(this);
        }

        override proc multiply(rhs: real): owned AbstractDataArray {
            return new owned DataArray1(rhs * this.arr, this.dimensions, this.units);
        }

        pragma "no doc"
        override proc _eq(lhs: borrowed DataArray1): bool where isOperable(lhs, this) {
            var rhs: borrowed DataArray1 = this;

            if lhs.arr._value == rhs.arr._value then
                return true;

            if lhs.rank != rhs.rank then
                return false;

            if lhs.dom.size: uint != rhs.dom.size: uint then
                return false;

            if lhs.dom.isRectangular() && rhs.dom.isRectangular() {
                for d in 0..#rhs.rank do
                    if rhs.dom.dim(d).size: uint != lhs.dom.dim(d).size: uint then
                        return false;
            }

            var ret = true;
            forall (l, r) in zip(lhs.arr, rhs.arr) with (&& reduce ret) do
                ret &&= (l == r);
            return ret;
        }

        /* Utility method to check if two ``DataArray`` are equal. */
        override proc eq(rhs: borrowed AbstractDataArray): bool {
            return rhs._eq(this);
        }

        override proc convertTendencyUnit() {
            var newMarker = new UnitMarker(this.units.length, this.units.mass, this.units.time - 1, this.units.electric_current, this.units.temperature, this.units.substance, this.units.luminous_intensity, this.units.coefficient, this.units.constant, this.units.symbol + "s^-1");
            this.units = newMarker;
        }

        override proc getDomShape(): 3*int {
            const shape = dom.shape;
            var retval: 3*int;
            for i in 0..<dom.rank do
            retval(i) = shape(i);
            for i in dom.rank..<3 do
            retval(i) = 0;
            return retval;
        }
    }

    /*
    A DataArray is a container over an array with additional support for dimension labels for each axis of the array.
    */
    class DataArray2: AbstractDataArray {
        /* The type of elements contained in the DataArray. */
        type eltType;

        /* The domain of the Chapel array owned by the DataArray.
           Refer to `the Chapel docs <https://chapel-lang.org/docs/primers/domains.html>`_ for more information on domains. 
        */
        var dom: domain(2, stridable = false);
        var arr: [dom] eltType;

        /* An index space indicating the labels for each of the axis of the array owned by the DataArray. */
        var dimensions: domain(string);
        var units: UnitMarker;        

        /* Initializes a DataArray with the given array. */
        proc init(in arr, dimensions: domain(string), unitMark: UnitMarker) {
            super.init(arr.eltType, arr.domain.rank);
            this.eltType = arr.eltType;
            this.dom = arr.domain;

            this.arr = arr;

            this.dimensions = dimensions;
            this.units = unitMark;
        }

        pragma "no doc"
        override proc _add(lhs: borrowed DataArray2): owned AbstractDataArray where isOperable(lhs, this) {
            var rhs: borrowed DataArray2 = this;
            var lhsUnitArr = new unit_array(lhs.units, lhs.arr);
            var rhsUnitArr = new unit_array(rhs.units, rhs.arr);            
            var res = lhsUnitArr + rhsUnitArr;
            return new owned DataArray2(res.arr, lhs.dimensions, lhs.units);
        }

        /* Utility method to add two ``DataArray``. 
        
          **Note**: This can be chained with other operators. 
        */
        override proc add(rhs: borrowed AbstractDataArray): owned AbstractDataArray {
            return rhs._add(this);
        }

        pragma "no doc"
        override proc _subtract(lhs: borrowed DataArray2): owned AbstractDataArray where isOperable(lhs, this) {
            var rhs: borrowed DataArray2 = this;
            var lhsUnitArr = new unit_array(lhs.units, lhs.arr);
            var rhsUnitArr = new unit_array(rhs.units, rhs.arr);            
            var res = lhsUnitArr - rhsUnitArr;
            return new owned DataArray2(res.arr, lhs.dimensions, lhs.units);
        }

        /* Utility method to subtract two ``DataArray``. 
        
          **Note**: This can be chained with other operators. 
        */
        override proc subtract(rhs: borrowed AbstractDataArray): owned AbstractDataArray {
            return rhs._subtract(this);
        }

        override proc multiply(rhs: real): owned AbstractDataArray {
            return new DataArray2(rhs * this.arr, this.dimensions, this.units);
        }

        pragma "no doc"
        override proc _eq(lhs: borrowed DataArray2): bool where isOperable(lhs, this) {
            var rhs: borrowed DataArray2 = this;

            if lhs.arr._value == rhs.arr._value then
                return true;

            if lhs.rank != rhs.rank then
                return false;

            if lhs.dom.size: uint != rhs.dom.size: uint then
                return false;

            if lhs.dom.isRectangular() && rhs.dom.isRectangular() {
                for d in 0..#rhs.rank do
                    if rhs.dom.dim(d).size: uint != lhs.dom.dim(d).size: uint then
                        return false;
            }

            var ret = true;
            forall (l, r) in zip(lhs.arr, rhs.arr) with (&& reduce ret) do
                ret &&= (l == r);
            return ret;
        }

        /* Utility method to check if two ``DataArray`` are equal. */
        override proc eq(rhs: borrowed AbstractDataArray): bool {
            return rhs._eq(this);
        }

        override proc convertTendencyUnit() {
            var newMarker = new UnitMarker(this.units.length, this.units.mass, this.units.time - 1, this.units.electric_current, this.units.temperature, this.units.substance, this.units.luminous_intensity, this.units.coefficient, this.units.constant, this.units.symbol + "s^-1");
            this.units = newMarker;
        }

        override proc getDomShape(): 3*int {
            const shape = dom.shape;
            var retval: 3*int;
            for i in 0..<dom.rank do
            retval(i) = shape(i);
            for i in dom.rank..<3 do
            retval(i) = 0;
            return retval;
        }
    }

    /*
    A DataArray is a container over an array with additional support for dimension labels for each axis of the array.
    */
    class DataArray3: AbstractDataArray {
        /* The type of elements contained in the DataArray. */
        type eltType;

        /* The domain of the Chapel array owned by the DataArray.
           Refer to `the Chapel docs <https://chapel-lang.org/docs/primers/domains.html>`_ for more information on domains. 
        */
        var dom: domain(3, stridable = false);
        var arr: [dom] eltType;

        /* An index space indicating the labels for each of the axis of the array owned by the DataArray. */
        var dimensions: domain(string);
        var units: UnitMarker;        

        /* Initializes a DataArray with the given array. */
        proc init(in arr, dimensions: domain(string), unitMark: UnitMarker) {
            super.init(arr.eltType, arr.domain.rank);
            this.eltType = arr.eltType;
            this.dom = arr.domain;

            this.arr = arr;

            this.dimensions = dimensions;
            this.units = unitMark;
        }

        pragma "no doc"
        override proc _add(lhs: borrowed DataArray3): owned AbstractDataArray where isOperable(lhs, this) {
            var rhs: borrowed DataArray3 = this;
            var lhsUnitArr = new unit_array(lhs.units, lhs.arr);
            var rhsUnitArr = new unit_array(rhs.units, rhs.arr);            
            var res = lhsUnitArr + rhsUnitArr;
            return new owned DataArray3(res.arr, lhs.dimensions, lhs.units);
        }

        /* Utility method to add two ``DataArray``. 
        
          **Note**: This can be chained with other operators. 
        */
        override proc add(rhs: borrowed AbstractDataArray): owned AbstractDataArray {
            return rhs._add(this);
        }

        pragma "no doc"
        override proc _subtract(lhs: borrowed DataArray3): owned AbstractDataArray where isOperable(lhs, this) {
            var rhs: borrowed DataArray3 = this;
            var lhsUnitArr = new unit_array(lhs.units, lhs.arr);
            var rhsUnitArr = new unit_array(rhs.units, rhs.arr);            
            var res = lhsUnitArr - rhsUnitArr;
            return new owned DataArray3(res.arr, lhs.dimensions, lhs.units);
        }

        /* Utility method to subtract two ``DataArray``. 
        
          **Note**: This can be chained with other operators. 
        */
        override proc subtract(rhs: borrowed AbstractDataArray): owned AbstractDataArray {
            return rhs._subtract(this);
        }

        override proc multiply(rhs: real): owned AbstractDataArray {
            return new DataArray3(rhs * this.arr, this.dimensions, this.units);
        }

        pragma "no doc"
        override proc _eq(lhs: borrowed DataArray3): bool where isOperable(lhs, this) {
            var rhs: borrowed DataArray3 = this;

            if lhs.arr._value == rhs.arr._value then
                return true;

            if lhs.rank != rhs.rank then
                return false;

            if lhs.dom.size: uint != rhs.dom.size: uint then
                return false;

            if lhs.dom.isRectangular() && rhs.dom.isRectangular() {
                for d in 0..#rhs.rank do
                    if rhs.dom.dim(d).size: uint != lhs.dom.dim(d).size: uint then
                        return false;
            }

            var ret = true;
            forall (l, r) in zip(lhs.arr, rhs.arr) with (&& reduce ret) do
                ret &&= (l == r);
            return ret;
        }

        /* Utility method to check if two ``DataArray`` are equal. */
        override proc eq(rhs: borrowed AbstractDataArray): bool {
            return rhs._eq(this);
        }

        override proc convertTendencyUnit() {
            var newMarker = new UnitMarker(this.units.length, this.units.mass, this.units.time - 1, this.units.electric_current, this.units.temperature, this.units.substance, this.units.luminous_intensity, this.units.coefficient, this.units.constant, this.units.symbol + "s^-1");
            this.units = newMarker;
        }

        override proc getDomShape(): 3*int {
            const shape = dom.shape;
            var retval: 3*int;
            for i in 0..<dom.rank do
            retval(i) = shape(i);
            for i in dom.rank..<3 do
            retval(i) = 0;
            return retval;
        }
    }

    pragma "no doc"
    proc isOperable(lhs: borrowed DataArray1, rhs: borrowed DataArray1) param {
        if !isPrimitive(lhs.eltType) && !isPrimitive(rhs.eltType) {
            return lhs.arr[lhs.dom.alignedLow].checkDims(rhs.arr[rhs.dom.alignedLow]);
        }
        return isCoercible(lhs.eltType, rhs.eltType);
    }

    pragma "no doc"
    proc isOperable(lhs: borrowed DataArray2, rhs: borrowed DataArray2) param {
        if !isPrimitive(lhs.eltType) && !isPrimitive(rhs.eltType) {
            return lhs.arr[lhs.dom.alignedLow].checkDims(rhs.arr[rhs.dom.alignedLow]);
        }
        return isCoercible(lhs.eltType, rhs.eltType);
    }

    pragma "no doc"
    proc isOperable(lhs: borrowed DataArray3, rhs: borrowed DataArray3) param {
        if !isPrimitive(lhs.eltType) && !isPrimitive(rhs.eltType) {
            return lhs.arr[lhs.dom.alignedLow].checkDims(rhs.arr[rhs.dom.alignedLow]);
        }
        return isCoercible(lhs.eltType, rhs.eltType);
    }

    proc isOperable(lhs: borrowed DataArray1, rhs: borrowed DataArray2) param {
        return false;
    }

    proc isOperable(lhs: borrowed DataArray2, rhs: borrowed DataArray1) param {
        return false;
    }

    proc isOperable(lhs: borrowed DataArray1, rhs: borrowed DataArray3) param {
        return false;
    }

    proc isOperable(lhs: borrowed DataArray3, rhs: borrowed DataArray1) param {
        return false;
    }

    proc isOperable(lhs: borrowed DataArray2, rhs: borrowed DataArray3) param {
        return false;
    }

    proc isOperable(lhs: borrowed DataArray3, rhs: borrowed DataArray2) param {
        return false;
    }

    operator +(lhs: borrowed AbstractDataArray, rhs: borrowed AbstractDataArray): owned AbstractDataArray {
        return lhs.add(rhs);
    }

    operator -(lhs: borrowed AbstractDataArray, rhs: borrowed AbstractDataArray): owned AbstractDataArray {
        return lhs.subtract(rhs);
    }

    operator *(lhs: real, rhs: borrowed AbstractDataArray): owned AbstractDataArray {
        return rhs.multiply(lhs);
    }

    operator ==(lhs: borrowed AbstractDataArray, rhs: borrowed AbstractDataArray): bool {
        return lhs.eq(rhs);
    } 

    operator !=(lhs: borrowed AbstractDataArray, rhs: borrowed AbstractDataArray): bool {
        return !(lhs == rhs);
    }    
}
