class generator;
  
  transaction trans;
  mailbox gen2driv;
  
  int count1;
  event ended;
  
  function new (mailbox gen2driv);
    this.gen2driv = gen2driv;
  endfunction
  
  task main();

    repeat(count1) begin
      trans = new();
      if( !trans.randomize() ) $fatal("Gen:: trans randomization failed");    
      gen2driv.put(trans);
      trans.display("gen");
    end
    -> ended;
  endtask 
  
endclass
