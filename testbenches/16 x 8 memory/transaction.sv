class transaction;

  rand bit wr_enb;
  randc bit [3:0] wr_addr;
  rand bit [7:0] wr_data;
  rand bit rd_enb;
  randc bit [3:0] rd_addr;
  bit [7:0] rd_data;
  bit rst;

  constraint c1 { rd_enb != wr_enb; }
  
  covergroup g1;
    aXr : cross rd_addr, rd_enb; //iff(rd_enb == 1);
    aXw : cross wr_addr, wr_enb iff(wr_enb);
  endgroup
  
  function new (); 
    g1 = new();
  endfunction

  function void display (string name);
    $write(" [%s] ", name);
    $display("[%0t] wr_enb=%b | wr_data=%0d | wr_addr=%0d", $time, wr_enb, wr_data, wr_addr);
    $display("[%0t] rd_enb=%b | rd_data=%0d | rd_addr=%0d", $time, rd_enb, rd_data, rd_addr);
  endfunction

endclass
