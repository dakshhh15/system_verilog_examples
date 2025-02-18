class scoreboard;
 
  mailbox mon2sb;
  transaction trans;
  int count;
  
  function new (mailbox mon2sb);
    this.mon2sb = mon2sb;
  endfunction
  
  task main;
    repeat (count)
      begin
        trans = new ();
        mon2sb.get(trans);
        trans.display( "SCOREBOARD" );
      
        if ( trans.out == (trans.sel) ? trans.b : trans.a)
          begin
            $display(" results match ");
	    $display("----------------------");
          end
        else
          $error (" mismatch ");
      end
  endtask
  
endclass
