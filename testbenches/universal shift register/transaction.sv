class transaction;
  
  rand bit [3:0] d;
  bit [1:0] s;
  bit sl, sr;
  bit [3:0] q;
  
  function void display (bit clk,string name);
    $display("[%s]", name);
    $display("[%0t] clk=%0b | s=%b | d=%b | q=%b", $time, clk, s, d, q);
    $display("----------");
  endfunction
  
endclass
