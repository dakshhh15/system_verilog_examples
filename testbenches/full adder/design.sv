module full_adder (output sum, carry,
                   input a, b, cin);
  
  assign {carry, sum} = a + b + cin;
  
endmodule
