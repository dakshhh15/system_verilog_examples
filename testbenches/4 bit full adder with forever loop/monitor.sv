class monitor;
  
  virtual int1 vint;
  mailbox mon2sb;
  
  //int count1;
  
  function new (virtual int1 vint, mailbox mon2sb);
    this.vint = vint;
    this.mon2sb = mon2sb;
  endfunction
  
  task main;
    forever
      #2
      begin
        transaction trans;
        trans = new();
        trans.a = vint.a;
        trans.b = vint.b;
        trans.cin = vint.cin;
        trans.sum = vint.sum;
        trans.cout = vint.cout;
        
        mon2sb.put(trans);
        trans.display(" MONITOR ");
        //count1 ++;
      end
  endtask
  
endclass
