module test;
  string fruits [5] = '{"mango", "apple", "orange", "banana", "pomegranate"};

  initial
	begin
		for (int i = 0; i<$size(fruits); i++)
			begin
				$display("fruits[%0d] = %s", i, fruits[i]);
			end
	end
endmodule
