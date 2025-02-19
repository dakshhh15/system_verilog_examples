module data_type_test;
  byte c;
  
  initial
    begin
      $display ("d1 = %b", c);
      c = 1'b1;
      $display ("d1 = %b", c);
      c = 4'b0101;
      $display ("d1 = %b", c);
      c = 2**7 - 1;
      $display ("d1 = %d", c);
      c = 2**8 - 32;
      $display ("d1 = %d", c);
    end
  
endmodule
