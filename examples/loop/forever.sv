module loop_test;
  
  initial
    begin
      forever
        begin
          #10 $display ("time = %0t | hello world", $time);
        end
    end
      
   initial
     begin
       #100 $finish;
     end
      
endmodule
