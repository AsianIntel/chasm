use UnitTest;
use State;
use DataArray;
use unit;
use unit_registry;
use marker;
use length;

proc test_state(test: borrowed Test) throws {
    var x = set_unitSystem("MKS");
    var l1 = lengthMarker(x.getLengthType("meter"));
    var l2 = lengthMarker(x.getLengthType("centimeter"));
    var dimensions: domain(string) = {"X", "Y"};

    var arr1 = [1, 2, 3, 4, 5];  
    var d_array1 = new shared DataArray1(arr1, dimensions, l1);    
    var d_array2 = new shared DataArray1(arr1, dimensions, l2);

    var state = new State();
    state.add("prop1", d_array1);
    state.add("prop2", d_array2);

    var prop1 = state.getValue("prop1");
    test.assertEqual(prop1.d_type, DType.Int64);
}

UnitTest.main();