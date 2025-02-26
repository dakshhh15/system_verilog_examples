class monitor;
  
  transaction trans;
  virtual int1 vint;
  mailbox mon2sb;
  
  function new (virtual int1 vint, mailbox mon2sb);
    this.vint = vint;
    this.mon2sb = mon2sb;
  endfunction
  
  task main;
    trans = new ();
    forever
      begin
        @(posedge vint.clk);
        trans.d = vint.d;
        trans.q = vint.q;
        trans.s = vint.s;
        
        mon2sb.put(trans);
        trans.display(vint.clk, "[MON]");
      end
  endtask
  
endclass
