class monitor;

  mailbox mbx2;
  virtual int1 vint;
  transaction trans;

  function new (virtual int1 vint, mailbox mbx2);
    this.vint = vint;
    this.mbx2 = mbx2;
  endfunction

  task main;
    forever
      begin
	trans = new ();
	@(posedge vint.clk);
	trans.wr_enb = vint.wr_enb;
	trans.wr_addr = vint.wr_addr;
	trans.wr_data = vint.wr_data;
	trans.rd_enb = vint.rd_enb;
	trans.rd_addr = vint.rd_addr;
	trans.rst = vint.rst;
	//@(posedge vint.clk);
	trans.rd_data = vint.rd_data;

	trans.display("MON"); $display("rst=%b", vint.rst);
	mbx2.put(trans);
      end
  endtask

endclass
