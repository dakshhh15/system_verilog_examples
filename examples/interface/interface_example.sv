//design
interface master_slave (input clk);
  logic slave_ready, rst;
  logic [7:0] data;
  logic [1:0] address;
  
  modport slave (output slave_ready,
                 input rst, data, address, clk);
  modport master (output address, data,
                  input clk, rst, slave_ready);
  
endinterface

module master (master_slave.master a);
  
  always @(posedge a.clk)
    begin
      
      if (! a.rst)
        begin
          a.address <= 0;
          a.data <= 0;
        end
      else
        begin
          if (a.slave_ready)
            begin
              a.address <= a.address + 1;
              a.data <= (a.address * 4);
            end
          else
            begin
              a.address <= a.address;
              a.data <= a.data;
            end
        end
      
    end
  
endmodule

module slave (master_slave.slave b);
  logic [7:0] reg_a, reg_b;
  logic reg_c;
  logic [3:0] reg_d;
  reg dly;
  reg [3:0] addr_dly;
  
  always@(posedge b.clk)
    begin
      
      if (! b.rst)
        addr_dly <= 0;
      else
        addr_dly <= b.address;
    end
  
  always@(posedge b.clk)
    begin
      
      if (! b.rst)
        begin
          reg_a <= 0;
          reg_b <= 0;
          reg_c <= 0;
          reg_d <= 0;
        end
      else
        begin
          case (addr_dly)
            0 : reg_a <= b.data;
            1 : reg_b <= b.data;
            2 : reg_c <= b.data;
            3 : reg_d <= b.data;
          endcase
        end
      
    end
  
  assign b.slave_ready = ~(b.address[1] & b.address[0]) | ~dly;
  
  always@(posedge b.clk)
    begin
      
      if (! b.rst)
        dly <= 1;
      else
        dly <= b.slave_ready;
      
    end
  
endmodule

module d_top (master_slave tif);
	
  	master 	m0 (tif.master);
  	slave 	s0 (tif.slave);
  
endmodule

//testbench
module tb;
  reg CLK;
  
  always #10 CLK = ~CLK;
  
  master_slave i1 (.clk(CLK));
  d_top i2 (i1);
  
  initial
    begin
      
      $monitor("[%0t] | clk=%0d | add[1:0]=%0d | data[7:0]=%0h | reg_a=%0d | reg_b=%0d", $time, CLK, i1.address, i1.data, i2.s0.reg_a, i2.s0.reg_b);
      
      CLK = 0;
      i1.rst = 0;
      repeat (5) @ (posedge CLK);
      i1.rst = 1;
      
      repeat (20) @ (posedge CLK);
      $finish;
      
    end
  
  /*initial
    begin
      $dumpvars(0,tb);
      $dumpfile("dump.vcd");
    end*/
  
endmodule
