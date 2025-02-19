module ass_dy_array;

  int fruits [] [string];

  initial
  begin

	fruits = new [4];

	fruits [0] = '{"orange" : 1, "banana" : 2, "apple" : 3};
	fruits [1] = '{"orange" : 4, "banana" : 5, "apple" : 6};
	fruits [2] = '{"orange" : 7, "banana" : 8, "apple" : 9};
	fruits [3] = '{"orange" : 10, "banana" : 11, "apple" : 12};

	foreach(fruits[i])
	  foreach(fruits[i][j]) begin
		$display("fruits[%0d][%0d] = %p", i,j,fruits[i][j]); end

  end

endmodule
