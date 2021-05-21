module Temperature {
    use SI;
    use IO;

    class Temperature: Quantity {
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
    //Other units of Kelvin not likely needed
    
    // type Yottakelvin = Temperature(0, 0, 0, 0, 1, 0, 0, 1e24, "YK");
    // type Zettakelvin = Temperature(0, 0, 0, 0, 1, 0, 0, 1e21, "ZK");
    // type Exakelvin = Temperature(0, 0, 0, 0, 1, 0, 0, 1e18, "EK");
    // type Petakelvin = Temperature(0, 0, 0, 0, 1, 0, 0, 1e15, "PK");
    // type Terakelvin = Temperature(0, 0, 0, 0, 1, 0, 0, 1e12, "TK");
    // type Gigakelvin = Temperature(0, 0, 0, 0, 1, 0, 0, 1e9, "GK");
    // type Megakelvin = Temperature(0, 0, 0, 0, 1, 0, 0, 1e6, "MK");
    // type Kilokelvin = Temperature(0, 0, 0, 0, 1, 0, 0, 1e3, "kK");
    // type Hectokelvin = Temperature(0, 0, 0, 0, 1, 0, 0, 1e2, "hK");
    // type Decakelvin = Temperature(0, 0, 0, 0, 1, 0, 0, 10, "daK");
    type Kelvin = Temperature(0, 0, 0, 0, 1, 0, 0, 1, "K");
    // type Decikelvin = Temperature(0, 0, 0, 0, 1, 0, 0, 1e-1, "dK");
    // type Centikelvin = Temperature(0, 0, 0, 0, 1, 0, 0, 1e-2, "cK");
    // type Millikelvin = Temperature(0, 0, 0, 0, 1, 0, 0, 1e-3, "mK");
    // type Microkelvin = Temperature(0, 0, 0, 0, 1, 0, 0, 1e-6, "μK");
    // type Nanokelvin = Temperature(0, 0, 0, 0, 1, 0, 0, 1e-9, "nK");
    // type Picokelvin = Temperature(0, 0, 0, 0, 1, 0, 0, 1e-12, "pK");
    // type Femtokelvin = Temperature(0, 0, 0, 0, 1, 0, 0, 1e-15, "fK");
    // type Attokelvin = Temperature(0, 0, 0, 0, 1, 0, 0, 1e-18, "aK");
    // type Zeptokelvin = Temperature(0, 0, 0, 0, 1, 0, 0, 1e-21, "zK");
    // type Yoctokelvin = Temperature(0, 0, 0, 0, 1, 0, 0, 1e-24, "yK");

    type degree_Celsius = Temperature(0, 0, 0, 0, 1, 0, 0, 273.15, "°C");
    type degree_Fahrenheit = Temperature(0, 0, 0, 0, 1, 0, 0, 459.67, "°F");
    
} 