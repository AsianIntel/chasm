/* Documentation for Sympl */
module Sympl {
  use DataArray;
  use SI;
  use Constants;
  use State;

  const d1: domain(2, stridable = true) = {0..3, 0..3};  
  var arr1: [d1] int = ((1,2,3,0),(3,4,5,0),(6,7,8,0),(9,10,11,0));
  var dimensions1: domain(string) = {"X", "Y"};
  var q1: Quantity = new Centimeter(1);
  var d_array1 = new shared DataArray(int, arr1, dimensions1, q1);

  // const d2: domain(2, stridable = true) = {0..3};  
  var arr2: [0..3] int = [1,2,3,0];
  var dimensions2: domain(string) = {"X"};
  var q2: Quantity = new Centimeter(1);
  var d_array2 = new shared DataArray(int, arr2, dimensions2, q2);

  const d3: domain(2, stridable = true) = {0..3, 0..3};
  var dimensions3: domain(string) = {"X", "Z"};
  var q3: Quantity = new Meter(1);
  var d_array3 = new shared DataArray(int, d3, dimensions3, q3, 1);

  var q4: Quantity = new Kilogram(2);
  var d_array4 = new shared DataArray(int, d3, dimensions3, q4, 1);

  // var q5: Quantity = new Second(1);
  // var d_array5 = new shared DataArray(int, d3, dimensions3, q5, 1);

  // var q6: Quantity = new Day(1);
  // var d_array6 = new shared DataArray(int, d3, dimensions3, q6, 1);

  var q7: Quantity = new degree_Fahrenheit(1);
  var d_array7 = new shared DataArray(int, d3, dimensions3, q7, 1);

  var q8: Quantity = new degree_Celsius(1);
  var d_array8 = new shared DataArray(int, d3, dimensions3, q8, 1);

  // writeln(d_array4);

  var state = new State();
  state.add("prop1", d_array1);
  state.add("prop2", d_array2);
  state.add("prop3", d_array3);
  state.add("prop4", d_array4);
  state.add("prop5", d_array7);
  state.add("prop6", d_array8);

  var lhs = state.getValue("prop5");
  var rhs = state.getValue("prop6");

  writeln(lhs);
  writeln(rhs);
  writeln(lhs.add(rhs));
}
