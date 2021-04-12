/* Documentation for Sympl */
module Sympl {

  use DataArray;
  writeln("New library: Sympl");
  const d: domain(2) = {0..3, 0..3};  
  var arr1: [d] int(64) = ((1,2,3,0),(3,4,5,0),(6,7,8,0),(9,10,11,0));  
  var dimensions = {"Alpha", "Beta"};
  var a1 = new DataArray(int(64), arr1, dimensions, "Pa");
  var a2 = new DataArray(int(64), arr1, dimensions, "Pa");
  var a3 = a1 - a2;
  var dim1 = a1.dims();
  writeln(a3.values());
  writeln(a3.dims(), a3.units());
  
  
  
}
