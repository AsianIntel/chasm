module Length {
    use SI;

    class Length: Quantity {
        type t;
        var toBase: real;
        var symbol: string;

        proc init(type t) where isLength(t) {
            super.init(1, 0, 0, 0, 0, 0, 0);
            this.t = t;
            var (toBase, symbol) = typeToBase(t);
            this.toBase = toBase;
            this.symbol = symbol;
        }

        proc init(type t, toBase: real, symbol: string) where isLength(t) {
            super.init(1, 0, 0, 0, 0, 0, 0);
            this.t = t;
            this.toBase = toBase;
            this.symbol = symbol;
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
                return (10**24, "Ym");
            when Zettameter do
                return (10**21, "Zm");
            when Exameter do
                return (10**18, "Em");
            when Petameter do
                return (10**15, "Pm");
            when Terameter do
                return (10**12, "Tm");
            when Gigameter do
                return (10**9, "Gm");
            when Megameter do
                return (10**6, "Mm");
            when Kilometer do
                return (10**3, "km");
            when Hectometer do
                return (10**2, "hm");
            when Decameter do
                return (10, "dam");
            when Meter do 
                return (1, "m");
            when Centimeter do
                return (0.01, "cm");
            when Millimeter do
                return (0.001, "mm");
            otherwise
                compilerError("Unregistered unit");
        }
    }
}