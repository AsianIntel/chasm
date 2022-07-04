use UnitTest;
use DataArray;
use State;
use length;
use unit;
use unit_registry;
use marker;

proc data_array_compile(test: borrowed Test) throws {
    var x = set_unitSystem("MKS");
    var l1 = lengthMarker(x.getLengthType("meter"));

    var arr = [1, 2, 3, 4, 5];  
    var dimensions: domain(string) = {"X", "Y"};
    
    var d_array1 = new shared DataArray1(arr, dimensions, l1);  
    test.assertTrue(true);
}

proc data_array_addition(test: borrowed Test) throws {
    var x = set_unitSystem("MKS");
    var l1 = lengthMarker(x.getLengthType("meter"));
    var l2 = lengthMarker(x.getLengthType("centimeter"));

    var arr1 = [1, 2, 3, 4, 5];   
    var dimensions = {"X", "Y"};
    var d1 = new shared DataArray1(arr1, dimensions, l1);
    var d2 = new shared DataArray1(arr1, dimensions, l2);

    var d3 = d1 + d2;    
    var d4 = new shared DataArray1([1.01, 2.02, 3.03, 4.04, 5.05], dimensions, l1);
    test.assertEqual(d3, d4);

    var d5 = d2 + d1;
    var d6 = new shared DataArray1([101.0, 202.0, 303.0, 404.0, 505.0], dimensions, l2);
    test.assertEqual(d5, d6);
}

proc data_array_subtraction(test: borrowed Test) throws {
    var x = set_unitSystem("MKS");
    var l1 = lengthMarker(x.getLengthType("meter"));
    var l2 = lengthMarker(x.getLengthType("centimeter"));

    var arr1 = [1, 2, 3, 4, 5];   
    var dimensions = {"X", "Y"};
    var d1 = new shared DataArray1(arr1, dimensions, l1);
    var d2 = new shared DataArray1(arr1, dimensions, l2);

    var d3 = d1 - d2;    
    var d4 = new shared DataArray1([0.99, 1.98, 2.97, 3.96, 4.95], dimensions, l1);
    test.assertEqual(d3, d4);

    var d5 = d2 - d1;
    var d6 = new shared DataArray1([-99.0, -198.0, -297.0, -396.0, -495.0], dimensions, l2);
    test.assertEqual(d5, d6);
}

proc data_array_convert(test: borrowed Test) throws {
    var x = set_unitSystem("MKS");
    var l1 = lengthMarker(x.getLengthType("meter"));

    var dimensions: domain(string) = {"X", "Y"};

    var arr1 = [1.0];
    var d_array1 = new shared DataArray1(arr1, dimensions, l1);

    var arr2: [0..1, 0..1] real = ((1.0, 1.0), (1.0, 1.0));
    var d_array2 = new shared DataArray2(arr2, dimensions, l1);

    var state = new State();
    state.add("prop1", d_array1);
    state.add("prop2", d_array2);

    var ada = state.getValue("prop1");
    var da1 = try! ada: borrowed DataArray1(real, l1.type);

    var ada2 = state.getValue("prop2");
    var da2 = try! ada2: borrowed DataArray2(real, l1.type);

    test.assertEqual(da1.arr, [1.0]);
    test.assertEqual(da2.arr, arr2);
}

UnitTest.main();