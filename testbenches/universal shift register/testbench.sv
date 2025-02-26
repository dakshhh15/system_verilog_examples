`include "interface.sv"
`include "test.sv"
`include "design.sv"

module tb;
  bit clk, clr;
  
  int1 intf (.clk(clk), .clr(clr));
  test t1 (intf);
  d dut (.q(intf.q),
                           .d(intf.d),
                           .clk(intf.clk),
                           .clr(intf.clr),
                           .s(intf.s),
                           .sl(intf.sl),
                           .sr(intf.sr));
  
  always #10 clk = ~clk;
  
  initial
    begin
      clk = 0;
      $dumpvars(0, tb);
      $dumpfile ("dump.vcd");
    end
  
  initial
    begin
      clr = 1;
      intf.sl = 0;
      intf.sr = 0;
      #10 clr = 0;
       
      #10 intf.s = 2'b11;
      intf.sr = 1'b1;
      #20 intf.s = 2'b01;
      
      //intf.sr = 1'b0;
      
      #80 intf.s = 2'b11;
      intf.sl = 1'b1;
      #20 intf.s = 2'b10; 
      
      #80 intf.s = 2'b11;
      #20 intf.s = 2'b00;
      //#10 clr = 1;
    end
  
endmodule
