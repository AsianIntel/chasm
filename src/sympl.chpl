/* Documentation for Sympl */
module Sympl {
  use DataArray;
  use SI;
  use Constants;
  use Map;

  const d1: domain(2) = {0..3, 0..3};  
  var arr1: [d1] int(64) = ((1,2,3,0),(3,4,5,0),(6,7,8,0),(9,10,11,0));
  var d_array1 = new shared DataArray(int(64), arr1);

  const d2: domain(2) = {0..3, 0..3};  
  var arr2: [d2] int = ((1,2,3,0),(3,4,5,0),(6,7,8,0),(9,10,11,0));
  var d_array2 = new shared DataArray(int, arr2);

  var d_map: map(string, shared AbstractDataArray);
  d_map.add("prop1", d_array1);
  d_map.add("prop2", d_array2);

  var prop = d_map.getBorrowed("prop1");
  var prop2 = prop.toDataArray();

  var length = new Length(Meter);

  writeln(getDType(int(64)));
}
