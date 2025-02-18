module mux (output out,
	    input a, b, sel);

	assign out = (sel) ? b : a;

endmodule
