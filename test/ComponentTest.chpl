use UnitTest;
use Components;
use Properties;
use Map;
use marker;

proc tendency_component_test(test: borrowed Test) throws {
    var labels: domain(string) = ["X", "Y", "Z"];
    var marker = new UnitMarker(1, 0, 0, 0, 0, 0, 0, 1, 0);
    var properties = new Properties(labels, marker);

    var input_properties = new map();
    input_properties.add("air_pressure", properties);

    var tendency_properties = new map();
    var diagnostic_properties = new map();

    var component = new TendencyComponent(input_properties, tendency_properties, diagnostic_properties);

    test.assertTrue(true);
}

proc diagnostic_component_test(test: borrowed Test) throws {
    var labels: domain(string) = ["X", "Y", "Z"];
    var marker = new UnitMarker(1, 0, 0, 0, 0, 0, 0, 1, 0);
    var properties = new Properties(labels, marker);

    var input_properties = new map();
    input_properties.add("air_pressure", properties);

    var diagnostic_properties = new map();

    var component = new TendencyComponent(input_properties, diagnostic_properties);

    test.assertTrue(true);
}