module QTime {
    use SI;
    use IO;

    class Time: Quantity {
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

    type Yottasecond = Time(0, 0, 1, 0, 0, 0, 0, 1e24, "Ys");
    type Zettasecond = Time(0, 0, 1, 0, 0, 0, 0, 1e21, "Zs");
    type Exasecond = Time(0, 0, 1, 0, 0, 0, 0, 1e18, "Es");
    type Petasecond = Time(0, 0, 1, 0, 0, 0, 0, 1e15, "Ps");
    type Terasecond = Time(0, 0, 1, 0, 0, 0, 0, 1e12, "Ts");
    type Gigasecond = Time(0, 0, 1, 0, 0, 0, 0, 1e9, "Gs");
    type Megasecond = Time(0, 0, 1, 0, 0, 0, 0, 1e6, "Ms");
    type Kilosecond = Time(0, 0, 1, 0, 0, 0, 0, 1e3, "ks");
    type Hectosecond = Time(0, 0, 1, 0, 0, 0, 0, 1e2, "hs");
    type Decasecond = Time(0, 0, 1, 0, 0, 0, 0, 10, "das");
    type Second = Time(0, 0, 1, 0, 0, 0, 0, 1, "s");
    type Decisecond = Time(0, 0, 1, 0, 0, 0, 0, 1e-1, "ds");
    type Centisecond = Time(0, 0, 1, 0, 0, 0, 0, 1e-2, "cs");
    type Millisecond = Time(0, 0, 1, 0, 0, 0, 0, 1e-3, "ms");
    type Microsecond = Time(0, 0, 1, 0, 0, 0, 0, 1e-6, "μs");
    type Nanosecond = Time(0, 0, 1, 0, 0, 0, 0, 1e-9, "ns");
    type Picosecond = Time(0, 0, 1, 0, 0, 0, 0, 1e-12, "ps");
    type Femtosecond = Time(0, 0, 1, 0, 0, 0, 0, 1e-15, "fs");
    type Attosecond = Time(0, 0, 1, 0, 0, 0, 0, 1e-18, "as");
    type Zeptosecond = Time(0, 0, 1, 0, 0, 0, 0, 1e-21, "zs");
    type Yoctosecond = Time(0, 0, 1, 0, 0, 0, 0, 1e-24, "ys");

    type Year = Time(0, 0, 1, 0, 0, 0, 0, 3.15367e7, "yr");
    type Day = Time(0, 0, 1, 0, 0, 0, 0, 8.64e4, "day");
    type Hour = Time(0, 0, 1, 0, 0, 0, 0, 3.6e3, "hr");
    type Minute = Time(0, 0, 1, 0, 0, 0, 0, 60, "min");
}