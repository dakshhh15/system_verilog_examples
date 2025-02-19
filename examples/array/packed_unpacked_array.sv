module dynamic_array;
  bit [3:0][7:0] data [2][4];

  initial
	begin
	  $display("data = %p", data);

	  foreach(data[i])
		foreach(data[i][j]) begin
		  data[i][j] = $random;
		  $display("data[%0d][%0d] = %p | 0x%h", i, j, data[i][j], data[i][j]); end

	  $display("data = %p", data);

	  //$display("data[0][3] = %p", data);
	end

endmodule
