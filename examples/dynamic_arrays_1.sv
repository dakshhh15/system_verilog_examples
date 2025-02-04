module dynamic_array;
  byte data [8];
  
  initial
    begin
      
      $display("data = %p", data);
      
      foreach(data[i])
        begin
          data[i] = $random;
          $display("data[%0d] = 0x%0h", i,data[i]);
        end
      
      $display("data = %p", data);
      
    end
endmodule
