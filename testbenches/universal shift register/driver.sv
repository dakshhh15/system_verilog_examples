class driver;
  
  virtual int1 vint;
  mailbox gen2driv;
  transaction trans;
  
  int count2;
  
  function new (virtual int1 vint, mailbox gen2driv);
    this.vint = vint;
    this.gen2driv = gen2driv;
  endfunction
  
  task reset;
    wait(vint.clr);
    vint.d <= 0;
  endtask
  
  task main;
    forever
      begin
        trans = new ();
        gen2driv.get(trans);
        
        vint.d <= trans.d;
        
        #0 trans.display(vint.clk, "[DRIV]");
        trans.q = vint.q;
        count2++;
        @(posedge vint.clk);
      end
  endtask
  
endclass    
