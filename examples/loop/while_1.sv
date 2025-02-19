module loop_test;
  bit clk;
  bit [3:0] counter;
  
  always #10 clk=~clk;
  
  initial
    begin
      $display("time = %0t |counter = %b | counter = %d", $time, counter, counter);
      
      while (counter <10)
        @(posedge clk)
        begin
          counter ++;
          $display("time = %0t |counter = %b | counter = %d", $time, counter, counter);
        end
      $display("time = %0t |counter = %b | counter = %d", $time, counter, counter);
      $finish;
    end
           
endmodule
