`include "transaction.sv"
`include "generator.sv"
`include "driver.sv"
`include "monitor.sv"
`include "scoreboard.sv"

class environment;
  
  virtual int1 vint;
  mailbox m1;
  mailbox m2;
  
  generator gen;
  driver driv;
  monitor mon;
  scoreboard sb;
  
  function new (virtual int1 vint);
    this.vint = vint;
    
    m1 = new ();
    m2 = new ();
    
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
    test();
    $finish;
  endtask
  
endclass
