module tb;
  
  bit [2:0] [3:0] data;
  
  initial
    begin
      $display("data = %b", data);
      
      data = 12'hae7;
      
      foreach (data[i])
        begin
          $display("data[%0d] = %b", i, data[i]);
          foreach (data[i][j]) begin
          $display ("data[%0d][%0d] = 0x%0h", i, j, data[i][j]); end
	end
    end
  
endmodule
