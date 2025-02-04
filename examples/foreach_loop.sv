module loop;
	int array[5] = '{1, 2, 3, 4, 5};
	int sum;

	initial 
      begin
		foreach (array[i])
			$display ("array[%0d] = %0d", i, array[i]);

		foreach (array[j])
          begin
			sum += array[j];
			$display ("array[%0d] = %0d, sum = %0d", j, array[j], sum);
		end
	end
endmodule
