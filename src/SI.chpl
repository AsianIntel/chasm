module SI {
    class Quantity {
        var length: int = 0;
        var mass: int = 0;
        var time: int = 0;
        var electric_current: int = 0;
        var temperature: int = 0;
        var substance: int = 0;
        var luminosity: int = 0;

        proc toBaseUnit(): real {
            halt("Virtual Class method");
        }
    }

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

    class Meter: Length {}
    class Centimetre: Length {}

    proc isLength(type value) param {
        return isSubtype(value, Length);
    }

    proc typeToBase(type value) {
        select value {
            when Meter do 
                return 1;
            when Centimetre do
                return 0.01;
            otherwise
                compilerError("Unregistered unit");
        }
    }

    operator ==(lhs: borrowed Quantity, rhs: borrowed Quantity): bool {
        return (
            lhs.length == rhs.length &&
            lhs.mass == rhs.mass &&
            lhs.time == rhs.time &&
            lhs.electric_current == rhs.electric_current &&
            lhs.temperature == rhs.temperature &&
            lhs.substance == rhs.substance &&
            lhs.luminosity == rhs.luminosity
        );
    }
}