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

        proc init(type t) where isLength(t) {
            super.init(1, 0, 0, 0, 0, 0, 0);
            this.t = t;
        }
    }

    class Meter: Length {}

    proc isLength(type value) param {
        return isSubtype(value, Length);
    }
}