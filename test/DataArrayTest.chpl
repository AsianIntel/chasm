use UnitTest;
use DataArray;
use length;
use mass;
use unit;

proc data_array_compile(test: borrowed Test) throws {
    var arr = [length(1, 0, 1, "m")];  
    var dimensions: domain(string) = {"X", "Y"};
    var d_array1 = new shared DataArray(arr, dimensions);

    var d = {0..3};
    var d_array2 = new shared DataArray(d, dimensions, 1);
    test.assertTrue(true);
}

proc data_array_addition(test: borrowed Test) throws {
    var dimensions = {"X", "Y"};
    var d1 = new shared DataArray([length(1, 0, 1, "m")], dimensions);
    var d2 = new shared DataArray([length(100, 0, 2, "cm")], dimensions);
    var d3 = d1 + d2;

    var d4 = new shared DataArray([length(1, 0, 1.02, "m")], dimensions);
    test.assertEqual(d3, d4);

    var d5 = d2 + d1;
    var d6 = new shared DataArray([length(100, 0, 102, "cm")], dimensions);
    test.assertEqual(d5, d6);
}

proc data_array_subtraction(test: borrowed Test) throws {
    var dimensions = {"X", "Y"};
    var k1 = new shared DataArray([mass(1, 0, 1, "kg"), mass(1, 0, 2, "kg")], dimensions);
    var k2 = new shared DataArray([mass(1000, 0, 2, "g"), mass(1000, 0, 1000, "g")], dimensions);
    var k3 = k1 - k2;

    var k4 = new shared DataArray([mass(1, 0, 0.998, "kg"), mass(1, 0, 1, "kg")], dimensions);
    test.assertEqual(k3, k4);

    var k5 = new shared DataArray([mass(0.001, 0, 3000, "g"), mass(0.001, 0, 3000, "g")], dimensions);
    var k6 = new shared DataArray([mass(0.001, 0, 2001, "g"), mass(0.001, 0, 1000, "g")], dimensions);
    var k7 = k1 - k5;
    test.assertNotEqual(k6, k7);
}

UnitTest.main();