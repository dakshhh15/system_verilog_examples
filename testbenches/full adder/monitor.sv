class monitor;
  
  virtual int1 vint;
  mailbox int2mon;
  
  function new (virtual int1 vint, mailbox int2mon);
    this.vint = vint;
    this.int2mon = int2mon;
  endfunction
  
  task main ();
    repeat (1)
      #3
      begin
        transaction trans = new ();
        
        trans.a = vint.a;
        trans.b = vint.b;
        trans.cin = vint.cin;
        trans.sum = vint.sum;
        trans.carry = vint.carry;
        
        int2mon.put(trans);
        trans.display("monitor");
      end
  endtask
  
endclass
