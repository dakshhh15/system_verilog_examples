class scoreboard;
  
  mailbox mon2sb;
  int count2;
  
  function new (mailbox mon2sb);
    this.mon2sb = mon2sb;
  endfunction
  
  task main;
    transaction trans = new ();
    forever
      begin
        mon2sb.get(trans);
        trans.display(" SCOREBOARD ");
        if (((trans.a + trans.b ) == trans.sum))
          $display(" MATCH ");
        else
          $error(" MISMATCH ");
        count2++;
        
      end
  endtask
  
endclass
