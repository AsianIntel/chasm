module Length {
    use SI;

    class Length: Quantity {
        param toBase: real;
        param symbol: string;
        var value: real;

        override proc toBaseUnit(): real {
            return this.toBase;
        }

        override proc retSymbol(): string {
            return this.symbol;
        }
                
    }

    proc isLength(type value) param {
        return isSubtype(value, Length);
    }

    type Yottameter = Length(1, 0, 0, 0, 0, 0, 0, 1e24, "Ym");
    type Zettameter = Length(1, 0, 0, 0, 0, 0, 0, 1e21, "Zm");
    type Exameter = Length(1, 0, 0, 0, 0, 0, 0, 1e18, "Em");
    type Petameter = Length(1, 0, 0, 0, 0, 0, 0, 1e15, "Pm");
    type Terameter = Length(1, 0, 0, 0, 0, 0, 0, 1e12, "Tm");
    type Gigameter = Length(1, 0, 0, 0, 0, 0, 0, 1e9, "Gm");
    type Megameter = Length(1, 0, 0, 0, 0, 0, 0, 1e6, "Mm");
    type Kilometer = Length(1, 0, 0, 0, 0, 0, 0, 1e3, "km");
    type Hectometer = Length(1, 0, 0, 0, 0, 0, 0, 1e2, "hm");
    type Decameter = Length(1, 0, 0, 0, 0, 0, 0, 10, "dam");
    type Meter = Length(1, 0, 0, 0, 0, 0, 0, 1, "m");
    type Decimeter = Length(1, 0, 0, 0, 0, 0, 0, 1e-1, "dm");
    type Centimeter = Length(1, 0, 0, 0, 0, 0, 0, 1e-2, "cm");
    type Millimeter = Length(1, 0, 0, 0, 0, 0, 0, 1e-3, "mm");
    type Micrometer = Length(1, 0, 0, 0, 0, 0, 0, 1e-6, "μm");
    type Nanometer = Length(1, 0, 0, 0, 0, 0, 0, 1e-9, "nm");
    type Picometer = Length(1, 0, 0, 0, 0, 0, 0, 1e-12, "pm");
    type Femtometer = Length(1, 0, 0, 0, 0, 0, 0, 1e-15, "fm");
    type Attometer = Length(1, 0, 0, 0, 0, 0, 0, 1e-18, "am");
    type Zeptometer = Length(1, 0, 0, 0, 0, 0, 0, 1e-21, "zm");
    type Yoctometer = Length(1, 0, 0, 0, 0, 0, 0, 1e-24, "ym");
}