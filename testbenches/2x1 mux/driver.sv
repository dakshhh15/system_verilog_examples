class driver;
  
  transaction trans;
  virtual int1 vint;
  mailbox gen2driv;
  int count;
  
  function new (virtual int1 vint, mailbox gen2driv);
    this.vint = vint;
    this.gen2driv = gen2driv;
  endfunction
  
  task main;
    repeat (count)
      begin
	
        gen2driv.get(trans);
      
        vint.a <= trans.a;
        vint.b <= trans.b;
        vint.sel <= trans.sel;
      
        //trans.out = vint.out;
      
        trans.display(" DRIVER ");
	//#1;
      end
  endtask
  
endclass
    
