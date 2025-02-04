module loop_test;
  
  initial
    begin
      integer cnt = 0;
      
      while (cnt < 5)
        begin
          cnt++;
          $display("time = %0t | cnt = %b", $time, cnt);
          #10;
        end
    end
  
endmodule

module loop_test;
  
  initial
    begin
      integer cnt = 0;
      
      while (cnt != 0)
        begin
          cnt++;
          $display("time = %0t | cnt = %b", $time, cnt);
          #10;
        end
    end
  
endmodule
