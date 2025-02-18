class transaction;
  rand bit [3:0] a, b;
  rand bit cin;
  bit [3:0] sum;
  bit cout;
  
  function void display (string name);
    $display("---------------------------");
    $display("---------------------------");
    $display("%s", name);
    $display("---------------------------");
    $display("a = %b | b = %b | cin = %b", a, b, cin);
    $display("sum = %b | carry = %b ", sum, cout);
    $display("-------------------------------------");
  endfunction
endclass
