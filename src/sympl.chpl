/* Documentation for Sympl */
module Sympl {
  use Map;
  use DataArray;
  use SI;
  use Constants;

  writeln("New library: Sympl");
  // var m: map(string, real);
  // var a1 = new DataArray(real, [2.45], {"Constant"}, "Pa");

  
  // m.add("one", 2.45);
  var c1 = new ConstantDict(defaultConstants);
  //writeln(c1.getConstant("gravitational_acceleration"));
  c1.setConstant("gravitational_acceleration", 10.0);
  //writeln(c1.getConstant("gravitational_acceleration"));

  const d: domain(2) = {0..3, 0..3};  
  var arr1: [d] int(64) = ((1,2,3,0),(3,4,5,0),(6,7,8,0),(9,10,11,0));  
  var dimensions = {"Alpha", "Beta"};
  var a1 = new DataArray(int(64), arr1, dimensions, "Pa");
  var a2 = new DataArray(int(64), arr1, dimensions, "Pa");
  var a3 = a1 + a2;
  var dim1 = a1.dims();

  // writeln(isSubtype(Meter, Length));
}
