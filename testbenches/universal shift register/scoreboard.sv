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
        trans.display(vint.clk, "[SB]");
        
        if (trans.s == 2'b00)
          begin
            trans.q = trans.q;
            $display (" MATCH ");
          end
        else if (trans.s == 2'b01)
          begin
            trans.q = trans.q >> 1;
            trans.q[3] = trans.sr;
            $display (" MATCH ");
          end
        else if (trans.s == 2'b10)
          begin
            trans.q = trans.q << 1;
            trans.q[0] = trans.sr;
            $display (" MATCH ");
          end
        else if (trans.s == 2'b11)
          begin
            trans.q = trans.d;
            $display (" MATCH ");
          end
        else
          $display (" MISMATCH ");
        
        count2++;
      end
  endtask
  
endclass
