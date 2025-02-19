`include "interface.sv"
`include "test.sv"
`include "design.sv"

module tb;
  bit clk, rst;
  
  int1 intf (.clk(clk), .rst(rst));
  test t1 (intf);
  d_ff dut (.q(intf.q),
            .d(intf.d),
            .clk(intf.clk),
            .rst(intf.rst));
  
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
      #15 rst = 1;
      #20 rst = 0;
    end
  
endmodule
