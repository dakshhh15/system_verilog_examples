class monitor;
  
  virtual int1 vint;
  mailbox mon2sb;
  transaction trans;
  
  function new (virtual int1 vint, mailbox mon2sb);
    this.vint = vint;
    this.mon2sb = mon2sb;
  endfunction
  
  task main;
    repeat (1)
      #1;
      begin
        trans = new();
        
        trans.a = vint.a;
        trans.b = vint.b;
        trans.cin = vint.cin;
        trans.sum = vint.sum;
        trans.cout = vint.cout;
        
        mon2sb.put(trans);
        trans.display("monitor");
      end
  endtask
  
endclass
