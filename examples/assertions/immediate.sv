module assertion;
  
  bit clk, a, b;
  
  always #5 clk = ~ clk;
  
  initial
    begin
      $dumpvars(0,assertion);
      $dumpfile("dump.vcd");
    end
  
  initial
    begin
      $monitor(" [%0t] clk = %0d | a = %0b | b = %0b ", $time, clk, a, b);
      a = 0;
      #15 a = 1;
      #20 a = 0;
      #30 a = 1;
      
    end
  
  initial
    begin
      b = 0;
      #10 b = 1;
      #20 b = 0;
      #30 b = 1;
      #10 $finish;
    end
  
   always @(posedge clk)
    begin
      assert (a && b);
    end
  
endmodule    
