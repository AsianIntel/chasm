/* Documentation for Sympl */
module Sympl {
  use DataArray;
  use SI;
  use Constants;
  use Map;

  const d1: domain(2, stridable = true) = {0..3, 0..3};  
  var arr1: [d1] int = ((1,2,3,0),(3,4,5,0),(6,7,8,0),(9,10,11,0));
  var dimensions1: domain(string) = {"X", "Y"};
  var d_array1 = new shared DataArray(int, arr1, dimensions1);

  // const d2: domain(2, stridable = true) = {0..3};  
  var arr2: [0..3] int = [1,2,3,0];
  var dimensions2: domain(string) = {"X"};
  var d_array2 = new shared DataArray(int, arr2, dimensions2);

  const d3: domain(2, stridable = true) = {0..3, 0..3};
  var dimensions3: domain(string) = {"X", "Z"};
  var d_array3 = new shared DataArray(int, d3, dimensions3, 1);

  var d_map: map(string, shared AbstractDataArray);
  d_map.add("prop1", d_array1);
  d_map.add("prop2", d_array2);
  d_map.add("prop3", d_array3);

  var lhs = d_map.getValue("prop1");
  var rhs = d_map.getValue("prop3");

  lhs.print();
  rhs.print();
  writeln(lhs + rhs - rhs);
  writeln(lhs.add(rhs).subtract(rhs));

  // var length = new Length(Meter);
}
