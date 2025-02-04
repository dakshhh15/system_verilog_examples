module dynamic_array;
  byte data [2][4];
  
  initial
    begin
      
      $display("data = %p", data);
      
      foreach(data[i])
        foreach(data[i][j]) begin
          data[i][j] = $random;
          $display("data[%0d][%0d] = 0x%0h", i,j,data[i][j]);
	  
        end
      
      $display("data = %p", data);
      
    end
endmodule
