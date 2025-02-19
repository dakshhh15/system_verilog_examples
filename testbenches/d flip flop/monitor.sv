class monitor;
  
  virtual int1 vint;
  mailbox mon2sb;
  
  function new (virtual int1 vint, mailbox mon2sb);
    this.vint = vint;
    this.mon2sb = mon2sb;
  endfunction
  
  task main;
    forever
      begin
        transaction trans;
        trans = new ();
        
        @(posedge vint.clk);
        @(posedge vint.clk);
        trans.d = vint.d;
        @(posedge vint.clk);
        trans.q = vint.q;
        @(posedge vint.clk);
        mon2sb.put(trans);
        trans.display(" Monitor ");
      end
  endtask
  
endclass
