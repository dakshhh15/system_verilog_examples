//design
module counter #(parameter width = 4) (output reg [width-1:0] count,
                                       output rollover,
                                       input clk, rst, load_en, down,
                                       input [width-1:0] load);
  
  always@(posedge clk or negedge rst)
    begin
      
      if (rst)
        count <= 8'b00;
      else
        begin
          if (load_en)
            count <= load;
          else
            begin
              if (down)
                count <= count - 1;
              else
                count <= count +1;
            end
        end
      
    end
  
  assign rollover = &count;
  
endmodule

//testbench
interface cnt_if #(parameter WIDTH = 4) (input bit clk);
  logic rst, load_en, down, rollover;
  logic [WIDTH-1:0] count;
  logic [WIDTH-1:0] load;
endinterface

module tb;
  reg CLK;
  integer i;
  
  always #10 CLK=~CLK;
  
  cnt_if u1 (.clk(CLK));
  counter i1(.clk(u1.clk), .rst(u1.rst), .load_en(u1.load_en), .down(u1.down), .load(u1.load), .rollover(u1.rollover), .count(u1.count));
  
  initial
    begin
      
      bit load_en, down;
      bit [3:0] load;
      
      $monitor("[%0t] | clk=%d | down=%0b | load_en=%0b | load=%b | count=%0b", $time, u1.clk, u1.down, u1.load_en, u1.load, u1.count);
      
      CLK = 0;
      u1.load_en = 0;
      u1.rst = 0;
      u1.load = 0;
      u1.down = 0;
      
      #10 u1.rst = 1;
      #10 u1.rst = 0;
      
      
      #5 begin u1.load = 4'hd; u1.load_en = 1; end
      #25 begin u1.load = 4'h3; u1.load_en = 0; end
      #45 begin u1.load = 4'h4; u1.load_en = 0; end
      #65 begin u1.load = 4'h5; u1.load_en = 0; end
      #85 begin u1.load = 4'h5; u1.load_en = 1; end
      #105 begin u1.load = 4'h4; u1.load_en = 1; end
      #125 begin u1.load = 4'h1; u1.load_en = 1; end      
      
      #10 $finish;
      
    end
endmodule
