`include "interface.sv"
`include "test.sv"
`include "design.sv"

module tb;
  bit clk, rst;
  
  int1 intf (.clk(clk), .rst(rst));
  test t1 (intf);
  ram dut (.clk(intf.clk),
              .rst(intf.rst),
              .wr_addr(intf.wr_addr),
	      .rd_addr(intf.rd_addr),
              .wr_enb(intf.wr_enb),
              .rd_enb(intf.rd_enb),
              .wr_data(intf.wr_data),
              .rd_data(intf.rd_data));
  
  always #10 clk = ~clk;
  
  initial
    begin
      clk = 0;
      rst = 1; 
      #20 rst = 0; 
      //#240 rst = 1; 
      //#15 rst = 0; 
      
    end
  
endmodule
