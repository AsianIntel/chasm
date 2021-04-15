module SI {
    class Quantity {
        var length: int;
        var mass: int;
        var time: int;
        var electric_current: int;
        var temperature: int;
        var substance: int;
        var luminosity: int;
    }

    class Length: Quantity {
        type t;
        var value: real;

        proc init(type t, value: real) {
            super.init(1, 0, 0, 0, 0, 0, 0);
            this.t = t;
            this.value = value;
        }
    }

    class Meter: Length {
        proc init(value: real) {
            super.init(Meter, value);
        }
    }

    proc isLength(type value) {
        return isSubtype(value, Length);
    }
}