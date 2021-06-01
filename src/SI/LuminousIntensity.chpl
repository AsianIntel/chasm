module LuminousIntensity {
    use Quantity;
    use IO;

    class LuminousIntensity: Quantity {
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

    type Yottacandela = LuminousIntensity(0, 0, 0, 0, 0, 0, 1, 1e24, "Ycd");
    type Zettacandela = LuminousIntensity(0, 0, 0, 0, 0, 0, 1, 1e21, "Zcd");
    type Exacandela = LuminousIntensity(0, 0, 0, 0, 0, 0, 1, 1e18, "Ecd");
    type Petacandela = LuminousIntensity(0, 0, 0, 0, 0, 0, 1, 1e15, "Pcd");
    type Teracandela = LuminousIntensity(0, 0, 0, 0, 0, 0, 1, 1e12, "Tcd");
    type Gigacandela = LuminousIntensity(0, 0, 0, 0, 0, 0, 1, 1e9, "Gcd");
    type Megacandela = LuminousIntensity(0, 0, 0, 0, 0, 0, 1, 1e6, "Mcd");
    type Kilocandela = LuminousIntensity(0, 0, 0, 0, 0, 0, 1, 1e3, "kcd");
    type Hectocandela = LuminousIntensity(0, 0, 0, 0, 0, 0, 1, 1e2, "hcd");
    type Decacandela = LuminousIntensity(0, 0, 0, 0, 0, 0, 1, 10, "dacd");
    type candela = LuminousIntensity(0, 0, 0, 0, 0, 0, 1, 1, "cd");
    type Decicandela = LuminousIntensity(0, 0, 0, 0, 0, 0, 1, 1e-1, "dcd");
    type Centicandela = LuminousIntensity(0, 0, 0, 0, 0, 0, 1, 1e-2, "ccd");
    type Millicandela = LuminousIntensity(0, 0, 0, 0, 0, 0, 1, 1e-3, "mcd");
    type Microcandela = LuminousIntensity(0, 0, 0, 0, 0, 0, 1, 1e-6, "μcd");
    type Nanocandela = LuminousIntensity(0, 0, 0, 0, 0, 0, 1, 1e-9, "ncd");
    type Picocandela = LuminousIntensity(0, 0, 0, 0, 0, 0, 1, 1e-12, "pcd");
    type Femtocandela = LuminousIntensity(0, 0, 0, 0, 0, 0, 1, 1e-15, "fcd");
    type Attocandela = LuminousIntensity(0, 0, 0, 0, 0, 0, 1, 1e-18, "acd");
    type Zeptocandela = LuminousIntensity(0, 0, 0, 0, 0, 0, 1, 1e-21, "zcd");
    type Yoctocandela = LuminousIntensity(0, 0, 0, 0, 0, 0, 1, 1e-24, "ycd");
}