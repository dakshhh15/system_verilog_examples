//display after cnt++ so doesnt start from 0
/*module loop_test;
  
  initial
    begin
      integer cnt = 0;
      
      do
        begin
          cnt++;
          $display("time = %0t | cnt = %b", $time, cnt);
          #10;
        end while (cnt<5);
    end
  
endmodule*/

module loop_test;
  
  initial
    begin
      integer cnt = 0;
      
      do
        begin
          $display("time = %0t | cnt = %b", $time, cnt);
          cnt++;
          #10;
        end while (cnt==0);
    end
  
endmodule
