class generator;
  
  virtual int1 vint;
  mailbox gen2driv;
  transaction trans;
  int count1;
  event ended;
  
  function new (virtual int1 vint, mailbox gen2driv);
    this.gen2driv = gen2driv;
    this.vint = vint;
  endfunction
  
  task main;
    repeat(count1)
      begin
        trans = new ();
        if( !trans.randomize() )
          $fatal("Gen:: trans randomization failed");
        //trans.d = $random;
        #0 trans.display(vint.clk, "[GEN]");
        gen2driv.put(trans);
        @(posedge vint.clk);
      end
    -> ended;
  endtask
  
endclass
