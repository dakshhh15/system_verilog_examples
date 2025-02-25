module asertion_ex;
  bit clk,b;
  bit a;
  
  always #5 clk = ~clk;

  initial begin 
     $monitor(" [%0t] clk = %0d | a = %b | b = %0b ", $time, clk, a, b);
        a=0; b=1;
    #15 a=1; b=0;
    #10 a=0; b=0;
    #10 a=1; b=0;
    #10 a=1; b=1;
    #10;
    $finish;
  end
  
  sequence p;
    @(posedge clk) ($past(a,2) == 1);
  endsequence

  assert property(p);
    
  initial begin 
    $dumpfile("dump.vcd"); $dumpvars;
  end
endmodule
