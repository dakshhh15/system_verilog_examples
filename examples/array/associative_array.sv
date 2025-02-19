module associative_array;

  int ar1 [int];
  string ar2 [int];
  int ar3 [string];
  string ar4 [string];

  initial
  begin

	ar1 = '{ 1 : 20,
		 2 : 40,
		 3 : 60 };
	ar2 = '{ 1 : "jan",
		 2 : "feb",
		 3 : "march",
		 4 : "april" };
	ar3 = '{ "orange" : 1,
		 "banana" : 2 };
	ar4 = '{ "orange" : "orange",
		 "kiwi" : "green",
		 "banana" : "yellow",
		 "apple" : "red",
		 "grapes" : "green" };

	$display ("ar1.size() = %0d", ar1.size());
	$display ("ar2.size() = %0d", ar2.size());
	$display ("ar3.size() = %0d", ar3.size());
	$display ("ar4.size() = %0d", ar4.size());

	ar1.delete(1);
	$display ("ar1.size() = %0d", ar1.size());

	if (ar1.exists (2))
        $display ("Found %0d !", ar1[2]);

  end

endmodule
