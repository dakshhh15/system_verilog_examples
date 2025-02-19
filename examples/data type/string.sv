module data_type_test;
  string print = "hello world";
  
  initial
    begin
      $display ("%s", print);
      
      //foreach works on arrays
      //foreach (print[i])
       // begin
          //$display ("%s", print[i]);
        //end
    end
  
endmodule
