module loop_test;
  
  initial
    begin
      repeat (7)
        begin
          #10 $display ("time = %0t | hello world", $time);
        end
    end
           
endmodule
