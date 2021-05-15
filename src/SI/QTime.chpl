module QTime {
    use SI;
    use IO;

    class QTime: Quantity {
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

    type Yottasecond = QTime(0, 0, 1, 0, 0, 0, 0, 1e24, "Ys");
    type Zettasecond = QTime(0, 0, 1, 0, 0, 0, 0, 1e21, "Zs");
    type Exasecond = QTime(0, 0, 1, 0, 0, 0, 0, 1e18, "Es");
    type Petasecond = QTime(0, 0, 1, 0, 0, 0, 0, 1e15, "Ps");
    type Terasecond = QTime(0, 0, 1, 0, 0, 0, 0, 1e12, "Ts");
    type Gigasecond = QTime(0, 0, 1, 0, 0, 0, 0, 1e9, "Gs");
    type Megasecond = QTime(0, 0, 1, 0, 0, 0, 0, 1e6, "Ms");
    type Kilosecond = QTime(0, 0, 1, 0, 0, 0, 0, 1e3, "ks");
    type Hectosecond = QTime(0, 0, 1, 0, 0, 0, 0, 1e2, "hs");
    type Decasecond = QTime(0, 0, 1, 0, 0, 0, 0, 10, "das");
    type Second = QTime(0, 0, 1, 0, 0, 0, 0, 1, "s");
    type Decisecond = QTime(0, 0, 1, 0, 0, 0, 0, 1e-1, "ds");
    type Centisecond = QTime(0, 0, 1, 0, 0, 0, 0, 1e-2, "cs");
    type Millisecond = QTime(0, 0, 1, 0, 0, 0, 0, 1e-3, "ms");
    type Microsecond = QTime(0, 0, 1, 0, 0, 0, 0, 1e-6, "μs");
    type Nanosecond = QTime(0, 0, 1, 0, 0, 0, 0, 1e-9, "ns");
    type Picosecond = QTime(0, 0, 1, 0, 0, 0, 0, 1e-12, "ps");
    type Femtosecond = QTime(0, 0, 1, 0, 0, 0, 0, 1e-15, "fs");
    type Attosecond = QTime(0, 0, 1, 0, 0, 0, 0, 1e-18, "as");
    type Zeptosecond = QTime(0, 0, 1, 0, 0, 0, 0, 1e-21, "zs");
    type Yoctosecond = QTime(0, 0, 1, 0, 0, 0, 0, 1e-24, "ys");

    type Year = QTime(0, 0, 1, 0, 0, 0, 0, 3.15367e7, "a");
    type Day = QTime(0, 0, 1, 0, 0, 0, 0, 8.64e4, "day");
    type Hour = QTime(0, 0, 1, 0, 0, 0, 0, 3.6e3, "hr");
    type Min = QTime(0, 0, 1, 0, 0, 0, 0, 6.0e1, "min");
}