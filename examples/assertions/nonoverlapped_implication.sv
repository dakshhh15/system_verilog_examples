module tb;
  bit clk,a,b;
  
  always #5 clk = ~clk;
  
  initial
    begin
      a=1; b=1;
      #15 a=0; b=0;
      #10 a=1; b=0;
      #10 a=0; b=0;
      #10 a=1; b=1;
      #10;
      $finish;
    end
  
  property p;
    @(posedge clk) a |=> b;
  endproperty

  assert property(p);
    
  initial begin 
    $dumpfile("dump.vcd");
    $dumpvars;
  end
    
endmodule
