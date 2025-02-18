class generator;
  
  mailbox gen2driv;
  transaction trans;
  int count;
  
  function new (mailbox gen2driv);
    this.gen2driv = gen2driv;
  endfunction
  
  task main;
    repeat (count)
      begin
        trans = new ();
        assert(trans.randomize());
        gen2driv.put(trans);
	//#0;
        trans.display(" GENERATOR ");
	//#3;
      end
    endtask
  
endclass
