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
