module data_type_test;
  shortint c;
  
  initial
    begin
      $display ("d1 = %b", c);
      c = 1'b1;
      $display ("d1 = %b", c);
      c = 4'b0101;
      $display ("d1 = %b", c);
      c = 2**13 - 1;
      $display ("d1 = %d", c);
      c = 2**16 - 12;
      $display ("d1 = %d", c);
    end
  
endmodule
