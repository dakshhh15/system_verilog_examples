`include "interface.sv"
`include "test.sv"
`include "design.sv"

module tb;
  
  int1 i1 ();
  test t1 (i1);
  
  full_adder dut (.sum(i1.sum),
                  .cout(i1.cout),
                  .a(i1.a),
                  .b(i1.b),
                  .cin(i1.cin));
  
endmodule  
