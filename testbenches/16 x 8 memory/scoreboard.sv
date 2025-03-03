class scoreboard;
  
  mailbox mbx2;
  transaction trans;
  int count2;
  bit [7:0] mem [16];
  
  function new (mailbox mbx2);
    this.mbx2 = mbx2;
    foreach(mem[i])
      mem[i] = 8'h00;
  endfunction
  
  task main;
    forever 
      begin
        trans = new ();
        mbx2.get(trans);
        trans.display("SB"); 
        
        if(trans.rst)
          begin
            foreach(mem[i])
              mem[i] = 8'h00;
          end
        
        
        if (trans.rd_enb & (~trans.rst))
          begin
            if (mem[trans.rd_addr] != trans.rd_data)
              $error("MISMACTH | add=%b | expected=%b actual=%b", trans.rd_addr, mem[trans.rd_addr], trans.rd_data);
            else
              begin
                $display("MATCH");
              end
          end
        else if (trans.wr_enb)
          begin
            mem[trans.wr_addr] = trans.wr_data;
            $display("WRITE");
          end
	$display("sb: %p", mem);
        $display("------------");
        count2++;
      end
  endtask
  
endclass
