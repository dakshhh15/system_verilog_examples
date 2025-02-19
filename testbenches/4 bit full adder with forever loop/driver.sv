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
       #1;
        gen2driv.get(trans);
        vint.a <= trans.a;
        vint.b <= trans.b;
        vint.cin <= trans.cin;
        
        trans.display(" DRIVER ");
        count2 ++;
        #1;
      end
  endtask
  
endclass
