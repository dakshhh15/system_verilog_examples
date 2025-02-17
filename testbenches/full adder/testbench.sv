`include "interfacee.sv"
`include "test.sv" 
`include "design.sv"

module tb;
  
  int1 intf();
  test t1(intf);
  
  full_adder dut (.sum(intf.sum),
                  .carry(intf.carry),
                  .a(intf.a),
                  .b(intf.b),
                  .cin(intf.cin));
  
endmodule
