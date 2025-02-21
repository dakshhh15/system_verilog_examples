module data_type_test;
  string a = "hello";
  string b = "helloo";
  
  initial
    begin
      
      if ( a == b)
        $display ("a=%s is EQUAL to b=%s", a, b);
      if ( a != b)
        $display ("a=%s is NOT EQUAL to b=%s", a, b);
      if ( a > b)
        $display ("a=%s is GREATER to b=%s", a, " ", b);
      if ( a < b)
        $display ("a=%s is NOT GREATER to b=%s", a, b);
      
      $display ("ab = %s", {a, b});
      $display ("a=%s", {4{a}});
      $display ("a[2]=%s | b[3]=%s", a[2], b[3]);
      
      
      
    end
  
endmodule
