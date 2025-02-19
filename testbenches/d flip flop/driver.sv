class driver;
  
  mailbox gen2driv;
  virtual int1 vint;
  
  int count2;
  
  function new (virtual int1 vint, mailbox gen2driv);
    this.gen2driv = gen2driv;
    this.vint = vint;
  endfunction
  
  task reset;
    wait(vint.rst);
    vint.d <= 0;
  endtask
  
  task main;
    transaction trans = new ();
    forever
      begin
        gen2driv.get(trans);
        @(posedge vint.clk);
        vint.d <= trans.d;
        @(posedge vint.clk);
        trans.q = vint.q;
        @(posedge vint.clk);
        trans.display(" DRIVER ");
        count2++;
      end
  endtask
  
endclass
