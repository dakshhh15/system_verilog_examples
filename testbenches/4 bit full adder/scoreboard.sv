class scoreboard;
  
  mailbox mon2sb;
  transaction trans;
  
    
  function new (mailbox mon2sb);
    this.mon2sb = mon2sb;
  endfunction
  
  task main;
    repeat (1)
      begin
        //#3;
	trans = new ();
        mon2sb.get(trans);
        trans.display("scoreboard");
        
        if (((trans.sum == trans.a ^ trans.b ^ trans.cin) && (trans.cout = (trans.a & trans.b) | (trans.b & trans.cin) | (trans.cin & trans.a))))
          $display("result matched");
        else
          $error ("mismatch");
      end
  endtask
  
endclass
