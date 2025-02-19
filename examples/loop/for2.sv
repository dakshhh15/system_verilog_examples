//stopping the counter using event defined in an always block

module loop_test;
  bit clk;
  bit [3:0] counter;
  bit [3:0] i;
  
  always #10 clk=~clk;
  event stop;
  
  initial
    begin
      
     $display("time = %0t |counter = %b | counter = %d", $time, counter, counter);
      
      for (i = 0; i<16; i++)
        begin
          @(posedge clk);
          counter = i;
	  if (i==15)
		-> stop;
          $display("time = %0t |counter = %b | counter = %d", $time, counter, counter);
        end
      
      $display("time = %0t |counter = %b | counter = %d", $time, counter, counter);
      $finish;
    end

	always
		@(stop) begin
			$finish;
				end
endmodule
