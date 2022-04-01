use UnitTest;
use Properties;
use marker;

proc test_properties(test: borrowed Test) throws {
    var labels: domain(string) = ["X", "Y", "Z"];
    var marker = new UnitMarker(1, 0, 0, 0, 0, 0, 0, 1, 0);

    var properties = new Properties(labels, marker);
    test.assertTrue(true);
}

UnitTest.main();