`include "transaction.sv"
`include "generator.sv"
`include "driver.sv"
`include "monitor.sv"
`include "scoreboard.sv"

class environment;
  
  //transaction trans = new();
  generator gen;
  driver driv;
  monitor mon;
  scoreboard sb;
  mailbox mbx1;
  mailbox mbx2;
  
  virtual int1 vint;
  
  function new (virtual int1 vint);
    this.vint = vint;
    
    mbx1 = new ();
    mbx2 = new ();
    gen = new (mbx1);
    driv = new (vint, mbx1);
    mon = new (vint, mbx2);
    sb = new (mbx2);
  endfunction
  
  task test;
    fork
      gen.main();
      driv.main();
      mon.main();
      sb.main();
    join_none
  endtask
  
  task post;
    wait (gen.ended.triggered);
    wait (gen.count1 == driv.count2);
    wait (gen.count1 == sb.count2);
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
