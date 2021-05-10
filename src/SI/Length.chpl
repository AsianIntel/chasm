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

    proc isLength(type value) param {
        return isSubtype(value, Length);
    }

    class Yottameter: Length {}
    class Zettameter: Length {}
    class Exameter: Length {}
    class Petameter: Length {}
    class Terameter: Length {}
    class Gigameter: Length {}
    class Megameter: Length {}
    class Kilometer: Length {}
    class Hectometer: Length {}
    class Decameter: Length {}
    class Meter: Length {}
    class Decimeter: Length {}
    class Centimeter: Length {}
    class Millimeter: Length {}
    class Micrometer: Length {}
    class Nanometer: Length {}
    class Pictometer: Length {}
    class Femtometer: Length {}
    class Attometer: Length {}
    class Zeptometer: Length {}
    class Yoctometer: Length {} 

    proc typeToBase(type value) {
        select value {
            when Yottameter do 
                return 10**24;
            when Zettameter do
                return 10**21;
            when Exameter do
                return 10**18;
            when Petameter do
                return 10**15;
            when Terameter do
                return 10**12;
            when Gigameter do
                return 10**9;
            when Megameter do
                return 10**6;
            when Kilometer do
                return 10**3;
            when Hectometer do
                return 10**2;
            when Decameter do
                return 10;
            when Meter do 
                return 1;
            when Centimeter do
                return 0.01;
            when Millimeter do
                return 0.001;
            otherwise
                compilerError("Unregistered unit");
        }
    }
}