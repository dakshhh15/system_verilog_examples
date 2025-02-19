class monitor;
  
  virtual int1 vint;
  mailbox mon2sb;
  
  function new(virtual int1 vint,mailbox mon2sb);
    this.vint = vint;
    this.mon2sb = mon2sb;
  endfunction

  task main;
    forever begin
      transaction trans;
      trans = new();
      @(posedge vint.clk);
      wait(vint.valid);
      trans.a   = vint.a;
      trans.b   = vint.b;
      @(posedge vint.clk);
      trans.sum   = vint.sum;
      @(posedge vint.clk);
      mon2sb.put(trans);
      trans.display(" Monitor ");
    end
  endtask
  
endclass
