class scoreboard;
  
  mailbox mon2sb;
  int count2;
  virtual int1 vint;
  
  function new (virtual int1 vint, mailbox mon2sb);
    this.mon2sb = mon2sb;
    this.vint = vint;
  endfunction
  
  task main;
    forever
      begin
        transaction trans;
        trans = new ();
        mon2sb.get(trans);
        trans.display(" SB ");
        
        if (trans.q == trans.d & (~vint.rst) )
          begin
            $display (" MATCH ");
            $display ("------------");
          end
        else
          $error (" MISMATCH ");
        count2++;
      end
  endtask
  
endclass
