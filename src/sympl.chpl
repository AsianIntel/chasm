/* Documentation for sympl */
module sympl {
  use Component;
  use SI;

  const D: domain(2) = {0..9, 0..9};
  var A: [D] int(64);
  var dimensions = {"Temp1", "Temp2"};
  var a = new Component(int(64), A, dimensions, "K");
  writeln(a.dimensions());
  a.dimension("Temp1");

  var length = new Length(real, 10);
}
