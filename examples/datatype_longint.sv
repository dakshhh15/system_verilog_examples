module data_type_test;
  longint c;
  
  initial
    begin
      $display ("d1 = %b", c);
      c = 1'b1;
      $display ("d1 = %b", c);
      c = 16'hde14;
      $display ("d1 = %b", c);
      c = 2**63 - 1;
      $display ("d1 = %d", c);
      c = 2**31 - 12;
      $display ("d1 = %d", c);
    end
  
endmodule
