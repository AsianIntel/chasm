module Mass {
    use SI;
    use IO;

    class Mass: Quantity {
        param toBase: real;
        param symbol: string;
        var value: real;        

        override proc toBaseUnit(): real {
            return this.toBase;
        }

        override proc symbol(): string {
            return this.symbol;
        }

        override proc writeThis(f) throws {
            f <~> "{value = " <~> value <~> ", symbol = " <~> symbol() <~> "}";
        }
    } 

    type Yottagram = Mass(0, 1, 0, 0, 0, 0, 0, 1e24, "Yg");
    type Zettagram = Mass(0, 1, 0, 0, 0, 0, 0, 1e21, "Zg");
    type Exagram = Mass(0, 1, 0, 0, 0, 0, 0, 1e18, "Eg");
    type Petagram = Mass(0, 1, 0, 0, 0, 0, 0, 1e15, "Pg");
    type Teragram = Mass(0, 1, 0, 0, 0, 0, 0, 1e12, "Tg");
    type Gigagram = Mass(0, 1, 0, 0, 0, 0, 0, 1e9, "Gg");
    type Megagram = Mass(0, 1, 0, 0, 0, 0, 0, 1e6, "Mg");
    type Kilogram = Mass(0, 1, 0, 0, 0, 0, 0, 1e3, "kg");
    type Hectogram = Mass(0, 1, 0, 0, 0, 0, 0, 1e2, "hg");
    type Decagram = Mass(0, 1, 0, 0, 0, 0, 0, 10, "dag");
    type gram = Mass(0, 1, 0, 0, 0, 0, 0, 1, "g");
    type Decigram = Mass(0, 1, 0, 0, 0, 0, 0, 1e-1, "dg");
    type Centigram = Mass(0, 1, 0, 0, 0, 0, 0, 1e-2, "cg");
    type Milligram = Mass(0, 1, 0, 0, 0, 0, 0, 1e-3, "mg");
    type Microgram = Mass(0, 1, 0, 0, 0, 0, 0, 1e-6, "μg");
    type Nanogram = Mass(0, 1, 0, 0, 0, 0, 0, 1e-9, "ng");
    type Picogram = Mass(0, 1, 0, 0, 0, 0, 0, 1e-12, "pg");
    type Femtogram = Mass(0, 1, 0, 0, 0, 0, 0, 1e-15, "fg");
    type Attogram = Mass(0, 1, 0, 0, 0, 0, 0, 1e-18, "ag");
    type Zeptogram = Mass(0, 1, 0, 0, 0, 0, 0, 1e-21, "zg");
    type Yoctogram = Mass(0, 1, 0, 0, 0, 0, 0, 1e-24, "yg");
}