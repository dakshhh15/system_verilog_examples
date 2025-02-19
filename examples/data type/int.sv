module data_type_test;
  int c;
  
  initial
    begin
      $display ("d1 = %b", c);
      c = 1'b1;
      $display ("d1 = %b", c);
      c = 8'b11100101;
      $display ("d1 = %h", c);
      c = 2**31 - 1;
      $display ("d1 = %d", c);
      c = 2**33 - 12;
      $display ("d1 = %d", c);
    end
  
endmodule
