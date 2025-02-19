`include "transaction.sv"
`include "generator.sv"
`include "driver.sv"
`include "monitor.sv"
`include "scoreboard.sv"

class environment;
  
  generator gen;
  driver driv;
  monitor mon;
  scoreboard sb;
  mailbox gen2driv;
  mailbox mon2sb;
  
  virtual int1 vint;
  
  function new (virtual int1 vint);
    this.vint = vint;
    
    gen2driv = new ();
    mon2sb = new ();
    gen = new (gen2driv);
    driv = new (vint, gen2driv);
    mon = new (vint, mon2sb);
    sb = new (mon2sb);
  endfunction
  
  task test;
    fork
      gen.main();
      driv.main();
      mon.main();
      sb.main();
    join_any
  endtask
  
  task post;
    wait (gen.ended.triggered);
    wait (gen.count1 == driv.count2);
    //wait (gen.count1 == mon.count2);
    //wait (gen.count1 == sb.count2);
  endtask
  
  task pre;
    driv.reset();
  endtask
  
  task run;
    pre();
    test();
    post();
    $finish;
  endtask
  
  
  
endclass
