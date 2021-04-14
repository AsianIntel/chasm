module Constants {
    use Map;

    //needs units support 
    var defaultConstants: map(string, real);
    defaultConstants.add("stefan_boltzmann_constant", 5.670367e-8);
    defaultConstants.add("gravitational_acceleration", 9.80665);
    defaultConstants.add("heat_capacity_of_dry_air_at_constant_pressure", 1004.64);
    defaultConstants.add("heat_capacity_of_water_vapor_at_constant_pressure", 1846.0);
    defaultConstants.add("specific_enthalpy_of_water_vapor", 2500.0);
    defaultConstants.add("freezing_temperature_of_liquid_water", 273.0);
    defaultConstants.add("thermal_conductivity_of_liquid_water", 0.57);
    defaultConstants.add("heat_capacity_of_solid_water_as_ice", 2108.0);
    defaultConstants.add("thermal_conductivity_of_solid_water_as_ice", 2.22);
    defaultConstants.add("thermal_conductivity_of_solid_water_as_snow", 0.2);
    defaultConstants.add("reference_air_pressure", 1.0132e5);
    defaultConstants.add("reference_air_temperature", 300.0);
    defaultConstants.add("thermal_conductivity_of_dry_air", 0.026);
    defaultConstants.add("gas_constant_of_dry_air", 287.0);
    defaultConstants.add("gas_constant_of_water_vapor", 461.5);
    defaultConstants.add("planetary_rotation_rate", 7.292e-5);
    defaultConstants.add("planetary_radius", 6.371e6);
    defaultConstants.add("latent_heat_of_vaporization_of_water", 2.5e6);
    defaultConstants.add("latent_heat_of_fusion_of_water", 333550.0);
    defaultConstants.add("density_of_liquid_water", 1e3);
    defaultConstants.add("density_of_solid_water_as_ice", 916.7);
    defaultConstants.add("density_of_solid_water_as_snow", 100.0);
    defaultConstants.add("solar_constant", 1367.0);
    defaultConstants.add("planck_constant", 6.62607004e-34);
    defaultConstants.add("speed_of_light", 299792458.0);
    defaultConstants.add("seconds_per_day", 86400.0);
    defaultConstants.add("avogadro_constant", 6.022140857e23);
    defaultConstants.add("boltzmann_constant", 1.38064852e-23);
    defaultConstants.add("loschmidt_constant", 2.6516467e25);
    defaultConstants.add("universal_gas_constant", 8.3144598);

    class ConstantDict {        
        var dict: map(string, real);
         
        
        proc init(dictionary: map(string, real)) {
            this.dict = dictionary;   

        }

        proc getConstant(constantName: string) {
            var Constantvalue = this.dict.getValue(constantName);
            return Constantvalue;

        }

        proc setConstant(constantName: string, constantValue: real) {
            this.dict.addOrSet(constantName, constantValue);

        }
    }
}