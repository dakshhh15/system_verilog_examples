class transaction;
  
  rand bit d;
  bit q;
  
  function void display (string name);
    $display(" %s ", name);
    $display("[%0t] d = %b | q = %b", $time, d, q);
  endfunction
  
endclass
