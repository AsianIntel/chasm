module SI {
    class Quantity {
        var length: int = 0;
        var mass: int = 0;
        var time: int = 0;
        var electric_current: int = 0;
        var temperature: int = 0;
        var substance: int = 0;
        var luminosity: int = 0;

        proc toBaseUnit(): real {
            halt("Virtual Class method");
        }
    }

    operator ==(lhs: borrowed Quantity, rhs: borrowed Quantity): bool {
        return (
            lhs.length == rhs.length &&
            lhs.mass == rhs.mass &&
            lhs.time == rhs.time &&
            lhs.electric_current == rhs.electric_current &&
            lhs.temperature == rhs.temperature &&
            lhs.substance == rhs.substance &&
            lhs.luminosity == rhs.luminosity
        );
    }
}