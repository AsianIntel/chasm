module Quantity {
    class Quantity {
        param length: int;
        param mass: int;
        param time: int;
        param electric_current: int;
        param temperature: int;
        param substance: int;
        param luminosity: int;

        proc toBaseUnit(): real {
            halt("Virtual Class method");
        }

        proc symbol(): string {
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

    operator !=(lhs: borrowed Quantity, rhs: borrowed Quantity): bool {
        return !(lhs == rhs);
    }
}