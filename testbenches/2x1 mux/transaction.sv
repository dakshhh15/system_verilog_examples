class transaction;
  rand bit a, b, sel;
  rand bit out;

  function void display(string name);
    //$display("---------------------------");
    //$display("---------------------------");
    $display("%s", name);
    //$display("---------------------------");
    $display(" [%0t] a = %b | b = %b | sel = %b | out = %b", $time, a, b, sel, out);
    //$display("out = %b ", out);
    //$display("-------------------------------------");
  endfunction

endclass
    
