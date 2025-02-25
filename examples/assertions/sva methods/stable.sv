module asertion_ex;
  bit clk,b;
  bit [3:0] a;
  
  always #5 clk = ~clk;

  initial begin 
     $monitor(" [%0t] clk = %0d | a = %b | b = %0b ", $time, clk, a, b);
        a=4'b0011; b=1;
    #15 a=4'b0011; b=0;
    #10 a=4'b1000; b=0;
    #10 a=4'b0111; b=0;
    #10 a=4'b0111; b=1;
    #10;
    $finish;
  end
  
  sequence p;
    @(posedge clk) $stable(a);
  endsequence

  assert property(p);
    
  initial begin 
    $dumpfile("dump.vcd"); $dumpvars;
  end
endmodule
