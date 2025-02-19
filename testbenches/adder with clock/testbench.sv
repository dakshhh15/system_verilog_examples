`include "interface.sv"
`include "test.sv"
`include "design.sv"

module tb;
  bit clk, rst;
  
  int1 intf (.clk(clk), .rst(rst));
  test t1 (intf);
  adder dut (.sum(intf.sum),
                  .a(intf.a),
                  .b(intf.b),
                  .clk(intf.clk),
                  .rst(intf.rst),
                  .valid(intf.valid));
  
  always #5 clk = ~clk;
  
  initial
    begin
      $dumpvars(0, tb);
      $dumpfile ("dump.vcd");
    end
  
  initial
    begin
      rst = 1;
      #5 rst = 0;
    end
  
endmodule
