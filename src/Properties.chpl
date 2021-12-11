module Properties {
    private use unit;
    private use length;
    private use mass;
    private use unit_time;
    private use electrical_current;
    private use temperature;
    private use substance;
    private use luminous_intensity;
    private use derived_unit;

    enum UType {Length, Mass, Time, ECurrent, Temp, Substance, Lum, DerivedUnit};

    proc toUType(type t) {
        if(isSubtype(t, length)) then
            return UType.Length;
        else if(isSubtype(t, mass)) then
            return UType.Mass;
        else if(isSubtype(t, time)) then
            return UType.Time;
        else if(isSubtype(t, electrical_current)) then
            return UType.ECurrent;
        else if(isSubtype(t, temperature)) then
            return UType.Temp;
        else if(isSubtype(t, substance)) then 
            return UType.Substance;
        else if(isSubtype(t, luminous_intensity)) then 
            return UType.Lum;
        else if(isSubtype(t, derived_unit)) then
            return UType.derived_unit;
    }

    class AbstractProperties {
        var u_type: UType;

        proc init(type u_type) {
            this.u_type = toUType(u_type);
        }
    }

    class Properties: AbstractProperties {
        type unitType;
        var dims: domain(string);    

        proc init(labels: domain(string), type unitType) {
            super.init(unitType);
            this.unitType = unitType;
            this.dims = labels;                      
        }

        proc printFields() {
            writeln(this.dims, " ", this.unitType:string);
        }
    }
}