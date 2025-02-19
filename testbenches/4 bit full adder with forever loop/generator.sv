class generator;
  
  transaction trans;
  mailbox gen2driv;
  
  int count1;
  event ended;
  
  function new (mailbox gen2driv);
    this.gen2driv = gen2driv;
  endfunction
  
  task main();
    trans = new ();
    repeat (count1)
      begin
        assert(trans.randomize());
        
        gen2driv.put(trans);
        #0 trans.display(" GENERATOR ");
        #2;
      end
    -> ended;
  endtask
  
endclass
