module mb;
  mailbox mail = new(2);
  
  initial
    begin
      for (int i = 0; i<7; i++)
        begin
          #1 mail.put(i);
          $display("[%0t] t0: put item  %0d | size of mailbox = %0d", $time, i, mail.num());
        end
    end
  
  initial
    forever
      begin
        int index;
        #2 mail.get (index);
        $display("[%0t] t1: get item  %0d | size of mailbox = %0d", $time, index, mail.num());
      end
  
endmodule
