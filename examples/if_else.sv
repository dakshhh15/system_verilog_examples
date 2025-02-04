module tb;
	int x = 4;

  	initial 
      begin
    	unique if (x == 3)
      		$display ("x is %0d", x);
    	else if (x == 5)
      		$display ("x is %0d", x);
      	else
      		$display ("x is neither 3 nor 5");

        
        
    	unique if (x == 3)
      		$display ("x is %0d", x);
    	else if (x == 5)
      		$display ("x is %0d", x);
  	end
endmodule

//multiple matches
module tb;
	int x = 4;

  	initial begin
      	unique if (x == 4)
          $display ("1. x is %0d", x);
      	else if (x == 4)
          $display ("2. x is %0d", x);
      	else
          $display ("x is not 4");
  	end
endmodule

module tb;
	int x = 4;

  	initial begin
      	// Exits if-else block once the first match is found
      	priority if (x == 4)
      		$display ("x is %0d", x);
      else if (x != 5)
      		$display ("x is %0d", x);
  	end
endmodule

module tb;
	int x = 4;

  	initial begin
      	// reports violation as there is no else block even though match is present
      	unique if (x == 4)
      		$display ("x is %0d", x);
      else if (x != 5)
      		$display ("x is %0d", x);
  	end
endmodule
