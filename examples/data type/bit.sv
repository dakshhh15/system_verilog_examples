module data_type_test;
  bit c;
  bit [3:0] d;
  
  initial
    begin
      $display ("d1 = %b, d2 = %b", c, d);
      c = 1'b1;
      d = 4'b0101;
      $display ("d1 = %b, d2 = %b", c, d);
    end
  
endmodule
