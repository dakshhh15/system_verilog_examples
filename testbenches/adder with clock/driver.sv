class driver;
  
  virtual int1 vint;
  mailbox gen2driv;
  
  int count2;
  
  function new (virtual int1 vint, mailbox gen2driv);
    this.vint = vint;
    this.gen2driv = gen2driv;
  endfunction
  
  task main;
    transaction trans = new ();
    forever
      begin
        gen2driv.get(trans);
        @(posedge vint.clk);
        vint.valid <= 1;
        vint.a <= trans.a;
        vint.b <= trans.b;
        @(posedge vint.clk);
        vint.valid <= 0;
        trans.sum <= vint.sum;
        @(posedge vint.clk);
        trans.display(" DRIVER ");
        count2 ++;
      end
  endtask
  
  task reset;
    wait(vint.rst);
    $display("[ DRIVER ] ----- Reset Started -----");
    vint.a <= 0;
    vint.b <= 0;
    vint.valid <= 0;
    wait(!vint.rst);
    $display("[ DRIVER ] ----- Reset Ended   -----");
  endtask
  
endclass
