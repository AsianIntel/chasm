use UnitTest;
use Properties;
use unit;
use unit_registry;
use marker;

proc test_properties(test: borrowed Test) throws {
    var x = set_unitSystem("MKS");
    var l1 = lengthMarker(x.getLengthType("meter"));
    var labels: domain(string) = ["X", "Y", "Z"];    

    var properties = new Properties(labels, l1);
    test.assertTrue(true);
}

UnitTest.main();