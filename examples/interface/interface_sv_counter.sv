//design
interface cnt_if #(parameter WIDTH = 4) (input bit clk);
  logic rst, load_en, down, rollover;
  logic [WIDTH-1:0] count;
  logic [WIDTH-1:0] load;
  modport dut (input clk, rst, load_en, down, load, output count, rollover);
endinterface


module counter #(parameter WIDTH = 4) (cnt_if.dut u1);
  
  always @(posedge u1.clk or posedge u1.rst) begin
    if (u1.rst)  
      u1.count = 0;
    else begin
      if (u1.load_en)
        u1.count = u1.load;
      else if (u1.down)
        u1.count = u1.count - 1;
      else
        u1.count = u1.count + 1;
    end
  end

  always @(*) begin
    if (u1.down)
      u1.rollover = (u1.count == 0); 
    else
      u1.rollover = (u1.count == {WIDTH{1'b1}}); 
  end

endmodule


//testbench
module tb;
  reg CLK;
  //integer i;
  
  always #10 CLK=~CLK;
  
  cnt_if i1 (.clk(CLK));
  counter c0 (i1);
  
  initial
    begin
      
      bit load_en, down;
      bit [3:0] load;
      
      $monitor("[%0t] | clk=%0d | rst=%b | down=%0b | load_en=%0b | load=%b | count=%0b | rollover=%b", $time, i1.clk, i1.rst, i1.down, i1.load_en, i1.load, i1.count, i1.rollover);
      
      CLK = 0;
      i1.load_en = 0;
      i1.rst = 0;
      i1.load = 0;
      i1.down = 0;
      
      #10 i1.rst = 1;
      #10 i1.rst = 0;
      
      
      #5 begin i1.load = 4'hd; i1.load_en = 1; end
      #25 begin i1.load = 4'h3; i1.load_en = 0; end
      #45 begin i1.load = 4'h4; i1.load_en = 0; end
      #65 begin i1.load = 4'h5; i1.load_en = 0; end
      #85 begin i1.load = 4'h5; i1.load_en = 1; end
      #105 begin i1.load = 4'h4; i1.load_en = 1; end
      #125 begin i1.load = 4'h1; i1.load_en = 1; end      
      
      #10 $finish;
      
    end
endmodule
