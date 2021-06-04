/* Documentation for Sympl */
module Sympl {
  public use DataArray;
  public use Constants;
  public use State;

  // const d2: domain(2, stridable = true) = {0..3};  
  // var arr2: [0..3] int = [1,2,3,0];
  // var dimensions2: domain(string) = {"X"};
  // var q2: Quantity = new Centimeter(1);
  // var d_array2 = new shared DataArray(int, arr2, dimensions2, q2);

  // const d3: domain(2, stridable = true) = {0..3, 0..3};
  // var dimensions3: domain(string) = {"X", "Z"};
  // var q3: Quantity = new Meter(1);
  // var d_array3 = new shared DataArray(int, d3, dimensions3, q3, 1);

  // var q4: Quantity = new Kilogram(2);
  // var d_array4 = new shared DataArray(int, d3, dimensions3, q4, 1);

  // var q9: Quantity = new candela(1);
  // var d_array9 = new shared DataArray(int, d3, dimensions3, q9, 1);

  // var q10: Quantity = new Millicandela(1);
  // var d_array10 = new shared DataArray(int, d3, dimensions3, q10, 1);
  
  // // var q5: Quantity = new Second(1);
  // // var d_array5 = new shared DataArray(int, d3, dimensions3, q5, 1);

  // // var q6: Quantity = new Day(1);
  // // var d_array6 = new shared DataArray(int, d3, dimensions3, q6, 1);

  // // var q7: Quantity = new degree_Fahrenheit(1);
  // // var d_array7 = new shared DataArray(int, d3, dimensions3, q7, 1);

  // // var q8: Quantity = new degree_Celsius(1);
  // // var d_array8 = new shared DataArray(int, d3, dimensions3, q8, 1);

  // // writeln(d_array4);

  // var state = new State();
  // // state.add("prop1", d_array1);
  // // state.add("prop2", d_array2);
  // // state.add("prop3", d_array3);
  // // state.add("prop4", d_array4);
  // // state.add("prop5", d_array7);
  // // state.add("prop6", d_array8);
  // state.add("prop7", d_array9);
  // state.add("prop8", d_array10);

  // var lhs = state.getValue("prop7");
  // var rhs = state.getValue("prop8");

  // writeln(lhs.add(rhs));

  // var dimensions = {"X", "Y"};
  // var d1 = new shared DataArray([new meter(1)], dimensions);
  // var d2 = new shared DataArray([new centimetre(2)], dimensions);
  // var d3 = d1 + d2;

  // var d4 = new shared DataArray([new meter(1.02)], dimensions);
  // writeln(d3 == d4);

  // class Child {
  //   var value: int;
  //   var f: func(real, real);
  // }

  // operator ==(lhs: borrowed Child, rhs: borrowed Child) {
  //   return lhs.value == rhs.value;
  // }

  // operator !=(lhs: borrowed Child, rhs: borrowed Child) {
  //   return !(lhs == rhs);
  // }

  // var a1 = [new Child(1, lambda(x: real) { return x * 1; })];
  // var a2 = [new Child(1, lambda(x: real) { return x * 2; })];
  // writeln(a1 == a2);
}
