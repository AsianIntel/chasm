use UnitTest;
use State;
use DataArray;
use length;

proc test_state(test: borrowed Test) throws {
    var dimensions: domain(string) = {"X", "Y"};

    var arr1 = [length(1, 0, 1, "m")];  
    var d_array1 = new shared DataArray1(arr1, dimensions);

    var arr2 = [length(0.01, 0, 2, "cm")];
    var d_array2 = new shared DataArray1(arr2, dimensions);

    var state = new State();
    state.add("prop1", d_array1);
    state.add("prop2", d_array2);

    var prop1 = state.getValue("prop1");
    test.assertEqual(prop1.d_type, DType.Undefined);
}

UnitTest.main();