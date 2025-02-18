class driver;
  
  virtual int1 vint;
  mailbox gen2driv;
  transaction trans;
  
  function new (virtual int1 vint, mailbox gen2driv);
    this.vint = vint;
    this.gen2driv = gen2driv;
  endfunction
  
  task main;
    repeat (1)
      begin
	trans = new ();
        gen2driv.get(trans);
        
        vint.a <= trans.a;
        vint.b <= trans.b;
        vint.cin <= trans.cin;
        
        trans.sum = vint.sum;
        trans.cout = vint.cout;
        
        trans.display("driver");
      end
  endtask
  
endclass
