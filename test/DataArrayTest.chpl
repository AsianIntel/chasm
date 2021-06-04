use UnitTest;
use DataArray;
use length;
use mass;

proc data_array_compile(test: borrowed Test) throws {
    var arr = [new meter(1)];  
    var dimensions: domain(string) = {"X", "Y"};
    var d_array1 = new shared DataArray(arr, dimensions);

    var d = {0..3};
    var d_array2 = new shared DataArray(d, dimensions, 1);
    test.assertTrue(true);
}

proc data_array_addition(test: borrowed Test) throws {
    var dimensions = {"X", "Y"};
    var d1 = new shared DataArray([new meter(1)], dimensions);
    var d2 = new shared DataArray([new centimetre(2)], dimensions);
    var d3 = d1 + d2;

    var d4 = new shared DataArray([new meter(1.02)], dimensions);
    test.assertEqual(d3, d4);

    var d5 = d2 + d1;
    var d6 = new shared DataArray([new centimetre(102)], dimensions);
    test.assertEqual(d5, d6);
}

proc data_array_subtraction(test: borrowed Test) throws {
    var dimensions = {"X", "Y"};
    var k1 = new shared DataArray([new kilogram(1), new kilogram(2)], dimensions);
    var k2 = new shared DataArray([new gram(2), new gram(1000)], dimensions);
    var k3 = k1 - k2;

    var k4 = new shared DataArray([new kilogram(0.998), new kilogram(1)], dimensions);
    test.assertEqual(k3, k4);

    var k5 = new shared DataArray([new gram(3000), new gram(3000)], dimensions);
    var k6 = new shared DataArray([new gram(2001), new gram(1000)], dimensions);
    var k7 = k1 - k5;
    test.assertNotEqual(k6, k7);
}

UnitTest.main();