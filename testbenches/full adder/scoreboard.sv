class scoreboard;
  
  mailbox int2mon;
  
  function new (mailbox int2mon);
    this.int2mon = int2mon;
  endfunction
  
  task main ();
    transaction trans;
    trans = new();
    repeat (1)
      #4
      begin
        int2mon.get(trans);
	trans.display("scoreboard");
        
        if ((trans.carry == ((trans.a & trans.b) | (trans.b & trans.cin) | (trans.cin & trans.a))) && ((trans.sum == trans.a ^ trans.b ^ trans.cin)));
        begin
          $display("result matched");
        end
        //else
          //$error("mismatch");
        
        
      end
  endtask
  
endclass
