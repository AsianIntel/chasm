use UnitTest;
use Components;
use Properties;
use Map;
use marker;

proc tendency_component_test(test: borrowed Test) throws {
    var labels: domain(string) = ["X", "Y", "Z"];
    var marker = new UnitMarker(-1, 1, -2, 0, 0, 0, 0, 1, 0, "Pa");
    var properties = new shared Properties(labels, marker);

    var input_properties: map(string, shared AbstractProperties);
    input_properties.add("air_pressure", properties);

    var tendency_properties: map(string, shared AbstractProperties);
    var diagnostic_properties: map(string, shared AbstractProperties);

    var component = new TendencyComponent(input_properties, tendency_properties, diagnostic_properties);

    test.assertTrue(true);
}

proc diagnostic_component_test(test: borrowed Test) throws {
    var labels: domain(string) = ["X", "Y", "Z"];
    var marker = new UnitMarker(-1, 1, -2, 0, 0, 0, 0, 1, 0, "Pa");
    var properties = new shared Properties(labels, marker);

    var input_properties: map(string, shared AbstractProperties);
    input_properties.add("air_pressure", properties);

    var diagnostic_properties: map(string, shared AbstractProperties);

    var component = new DiagnosticComponent(input_properties, diagnostic_properties);

    test.assertTrue(true);
}

UnitTest.main();