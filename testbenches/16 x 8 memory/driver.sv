class driver;

  mailbox mbx1;
  virtual int1 vint;
  transaction trans;

  int count2;

  function new (virtual int1 vint, mailbox mbx1);
    this.vint = vint;
    this.mbx1 = mbx1;
  endfunction

  task reset;
    wait(vint.rst);
    vint.rd_data <= 0;
  endtask

  task main;
    forever
      begin
	trans = new ();
	mbx1.get(trans);

	vint.wr_enb <= trans.wr_enb;
	vint.wr_data <= trans.wr_data;
	vint.wr_addr <= trans.wr_addr;
	vint.rd_enb <= trans.rd_enb;
	vint.rd_addr <= trans.rd_addr;

	#0 trans.display("DRIV"); $display("rst=%b", vint.rst);
        @(posedge vint.clk);
	//trans.rd_data = vint.rd_data;
	count2++;
      end
  endtask

endclass
