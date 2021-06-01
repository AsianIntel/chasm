module Substance {
    use Quantity;
    use IO;

    class Substance: Quantity {
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

    type Yottamole = Substance(0, 0, 0, 0, 0, 1, 0, 1e24, "Ymol");
    type Zettamole = Substance(0, 0, 0, 0, 0, 1, 0, 1e21, "Zmol");
    type Examole = Substance(0, 0, 0, 0, 0, 1, 0, 1e18, "Emol");
    type Petamole = Substance(0, 0, 0, 0, 0, 1, 0, 1e15, "Pmol");
    type Teramole = Substance(0, 0, 0, 0, 0, 1, 0, 1e12, "Tmol");
    type Gigamole = Substance(0, 0, 0, 0, 0, 1, 0, 1e9, "Gmol");
    type Megamole = Substance(0, 0, 0, 0, 0, 1, 0, 1e6, "Mmol");
    type Kilomole = Substance(0, 0, 0, 0, 0, 1, 0, 1e3, "kmol");
    type Hectomole = Substance(0, 0, 0, 0, 0, 1, 0, 1e2, "hmol");
    type Decamole = Substance(0, 0, 0, 0, 0, 1, 0, 10, "damol");
    type mole = Substance(0, 0, 0, 0, 0, 1, 0, 1, "mol");
    type Decimole = Substance(0, 0, 0, 0, 0, 1, 0, 1e-1, "dmol");
    type Centimole = Substance(0, 0, 0, 0, 0, 1, 0, 1e-2, "cmol");
    type Millimole = Substance(0, 0, 0, 0, 0, 1, 0, 1e-3, "mmol");
    type Micromole = Substance(0, 0, 0, 0, 0, 1, 0, 1e-6, "μmol");
    type Nanomole = Substance(0, 0, 0, 0, 0, 1, 0, 1e-9, "nmol");
    type Picomole = Substance(0, 0, 0, 0, 0, 1, 0, 1e-12, "pmol");
    type Femtomole = Substance(0, 0, 0, 0, 0, 1, 0, 1e-15, "fmol");
    type Attomole = Substance(0, 0, 0, 0, 0, 1, 0, 1e-18, "amol");
    type Zeptomole = Substance(0, 0, 0, 0, 0, 1, 0, 1e-21, "zmol");
    type Yoctomole = Substance(0, 0, 0, 0, 0, 1, 0, 1e-24, "ymol");    
    
}