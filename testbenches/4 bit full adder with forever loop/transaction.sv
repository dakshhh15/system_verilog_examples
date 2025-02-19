class transaction;
  
  rand bit [3:0] a,b;
  bit [3:0] sum;
  
  function void display (string name);
    $display("-------------------------");
    $display(" %s ", name);
    $display("[%0t] a = %b, %0d | b = %b, %0d | sum = %b, %0d", $time, a, a, b, b, sum, sum);
    $display("-------------------------");
  endfunction
  
endclass    
