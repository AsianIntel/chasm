module ElectricCurrent {
    use Quantity;
    use IO;

    class ElectricCurrent: Quantity {
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

    type Yottaampere = ElectricCurrent(0, 0, 0, 1, 0, 0, 0, 1e24, "YA");
    type Zettaampere = ElectricCurrent(0, 0, 0, 1, 0, 0, 0, 1e21, "ZA");
    type Exaampere = ElectricCurrent(0, 0, 0, 1, 0, 0, 0, 1e18, "EA");
    type Petaampere = ElectricCurrent(0, 0, 0, 1, 0, 0, 0, 1e15, "PA");
    type Teraampere = ElectricCurrent(0, 0, 0, 1, 0, 0, 0, 1e12, "TA");
    type Gigaampere = ElectricCurrent(0, 0, 0, 1, 0, 0, 0, 1e9, "GA");
    type Megaampere = ElectricCurrent(0, 0, 0, 1, 0, 0, 0, 1e6, "MA");
    type Kiloampere = ElectricCurrent(0, 0, 0, 1, 0, 0, 0, 1e3, "kA");
    type Hectoampere = ElectricCurrent(0, 0, 0, 1, 0, 0, 0, 1e2, "hA");
    type Decaampere = ElectricCurrent(0, 0, 0, 1, 0, 0, 0, 10, "daA");
    type ampere = ElectricCurrent(0, 0, 0, 1, 0, 0, 0, 1, "A");
    type Deciampere = ElectricCurrent(0, 0, 0, 1, 0, 0, 0, 1e-1, "dA");
    type Centiampere = ElectricCurrent(0, 0, 0, 1, 0, 0, 0, 1e-2, "cA");
    type Milliampere = ElectricCurrent(0, 0, 0, 1, 0, 0, 0, 1e-3, "mA");
    type Microampere = ElectricCurrent(0, 0, 0, 1, 0, 0, 0, 1e-6, "μA");
    type Nanoampere = ElectricCurrent(0, 0, 0, 1, 0, 0, 0, 1e-9, "nA");
    type Picoampere = ElectricCurrent(0, 0, 0, 1, 0, 0, 0, 1e-12, "pA");
    type Femtoampere = ElectricCurrent(0, 0, 0, 1, 0, 0, 0, 1e-15, "fA");
    type Attoampere = ElectricCurrent(0, 0, 0, 1, 0, 0, 0, 1e-18, "aA");
    type Zeptoampere = ElectricCurrent(0, 0, 0, 1, 0, 0, 0, 1e-21, "zA");
    type Yoctoampere = ElectricCurrent(0, 0, 0, 1, 0, 0, 0, 1e-24, "yA");  
    
}