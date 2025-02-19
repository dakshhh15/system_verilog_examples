`include "interface.sv"
`include "test.sv"
`include "design.sv"

module tb;
  
  int1 intf ();
  test t1 (intf);
  full_adder dut (.sum(intf.sum),
              .a(intf.a),
              .b(intf.b));
  
endmodule
