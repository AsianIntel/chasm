module Mass {
    use SI;

    class Mass: Quantity {
        type t;
        var toBase: real;

        proc init(type t) where isMass(t) {
            super.init(0, 1, 0, 0, 0, 0, 0);
            this.t = t;
            this.toBase = typeToBase(t);
        }

        proc init(type t, toBase: real) where isMass(t) {
            super.init(0, 1, 0, 0, 0, 0, 0);
            this.t = t;
            this.toBase = toBase;
        }

        override proc toBaseUnit(): real {
            return this.toBase;
        }

    }

    class Kilogram: Mass {}
    class Gram: Mass {}
    class Centigram: Mass {}
    class Milligram: Mass {}

    proc isMass(type value) param {
        return isSubtype(value, Mass);
    }

    proc typeToBase(type value) {
        select value {
            when Kilogram do
                return 1000;
            when Gram do 
                return 1;
            when Centigram do
                return 0.01;
            when Milligram do
                return 0.001;
            otherwise
                compilerError("Unregistered unit");
        }
    }

}