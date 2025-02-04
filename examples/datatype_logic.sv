module data_type_test;
  logic a;
  logic [3:0] b;
  
  initial
    begin
      $display ("d1 = %b, d2 = %b", a, b);
      a = 1'b1;
      b = 4'b0101;
      $display ("d1 = %b, d2 = %b", a, b);
    end
  
endmodule
