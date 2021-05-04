module Length {
    use SI;

    class Length: Quantity {
        type t;
        var toBase: real;

        proc init(type t) where isLength(t) {
            super.init(1, 0, 0, 0, 0, 0, 0);
            this.t = t;
            this.toBase = typeToBase(t);
        }

        proc init(type t, toBase: real) where isLength(t) {
            super.init(1, 0, 0, 0, 0, 0, 0);
            this.t = t;
            this.toBase = toBase;
        }

        override proc toBaseUnit(): real {
            return this.toBase;
        }
    }

    class Kilometer: Length {}
    class Meter: Length {}
    class Centimetre: Length {}
    class Milimetre: Length {}

    proc isLength(type value) param {
        return isSubtype(value, Length);
    }

    proc typeToBase(type value) {
        select value {
            when Kilometer do
                return 1000;
            when Meter do 
                return 1;
            when Centimetre do
                return 0.01;
            when Milimetre do
                return 0.001;
            otherwise
                compilerError("Unregistered unit");
        }
    }
}