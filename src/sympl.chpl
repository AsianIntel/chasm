/* Documentation for Sympl */
module Sympl {
  use DataArray;
  use SI;
  use Constants;
  use Map;

  const d1: domain(2, stridable = true) = {0..3, 0..3};  
  var arr1: [d1] real = ((1,2,3,0),(3,4,5,0),(6,7,8,0),(9,10,11,0));
  var dimensions1: domain(string) = {"X", "Y"};
  var d_array1 = new shared DataArray(real, arr1, dimensions1);

  const d2: domain(2, stridable = true) = {0..3, 0..3};  
  var arr2: [d2] real = ((1,2,3,0),(3,4,5,0),(6,7,8,0),(9,10,11,0));
  var dimensions2: domain(string) = {"X", "Y"};
  var d_array2 = new shared DataArray(real, arr2, dimensions2);

  const d3: domain(2, stridable = true) = {0..5, 0..5};
  var dimensions3: domain(string) = {"X", "Y"};
  var d_array3 = new shared DataArray(int, d3, dimensions3, 1);

  var d_map: map(string, shared AbstractDataArray(rank = 2, stridable = true));
  d_map.add("prop1", d_array1);
  d_map.add("prop2", d_array2);
  d_map.add("prop3", d_array3);

  var prop = d_map.getBorrowed("prop3");
  var prop2 = prop.toDataArray(int);
  writeln(prop2);

  var length = new Length(Meter);
}
