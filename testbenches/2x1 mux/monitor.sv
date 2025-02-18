class monitor;
  
  transaction trans;
  virtual int1 vint;
  mailbox mon2sb;
  int count;

  function new (virtual int1 vint, mailbox mon2sb);
    this.vint = vint;
    this.mon2sb = mon2sb;
  endfunction
  
  task main;
    repeat(count)
      begin
	#1;
        trans = new ();
      
        trans.a = vint.a;
        trans.b = vint.b;
        trans.sel = vint.sel;
        trans.out = vint.out;
      
        mon2sb.put(trans);
        trans.display( " MONITOR " );
        
      end
  endtask
  
endclass
