class driver;
  
  virtual int1 vint;
  mailbox gen2driv;
 
  function new (virtual int1 vint, mailbox gen2driv);
    this.vint = vint;
    this.gen2driv = gen2driv;
  endfunction
  
  task main ();
    repeat (1)
      begin
        transaction trans = new();
        gen2driv.get(trans);
        
        vint.a <= trans.a;
        vint.b <= trans.b;
        vint.cin <= trans.cin;
        
        trans.sum = vint.sum;
        trans.carry = vint.carry;
        
        trans.display("driver");
      end
  endtask
  
endclass
