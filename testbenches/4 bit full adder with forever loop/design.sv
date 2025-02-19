module full_adder (output reg [3:0] sum,
                   output cout,
                   input [3:0] a, b,
                   input cin);
  
  assign {cout, sum} = a + b + cin;
  
endmodule
