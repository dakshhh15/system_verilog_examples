`include "transaction.sv"
`include "generator.sv"
`include "monitor.sv"
`include "driver.sv"
`include "scoreboard.sv"


class environment;
  
  transaction trans;
  generator gen;
  monitor mon;
  driver driv;
  scoreboard sb;
  
  mailbox m1;
  mailbox m2;
  
  virtual int1 vint;
  
  function new (virtual int1 vint);
    this.vint = vint;
    
    m1 = new ();
    m2 = new ();
    
    trans = new ();
    gen = new (m1);
    driv = new (vint, m1);
    mon = new (vint, m2);
    sb = new (m2);
  endfunction
  
  task test;
    fork
      gen.main();
      driv.main();
      mon.main();
      sb.main();
    join
  endtask
  
  task run;
    test ();
    $finish;
  endtask
  
endclass
