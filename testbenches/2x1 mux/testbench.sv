`include "interface.sv"
`include "test.sv"
`include "design.v"

module tb;
  
  int1 i1 ();
  test t1 (i1);
  
  mux dut (.out(i1.out),
           .a(i1.a),
           .b(i1.b),
           .sel(i1.sel));
  
  
endmodule  
