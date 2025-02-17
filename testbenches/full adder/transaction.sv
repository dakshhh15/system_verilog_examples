class transaction;
  rand bit a;
  rand bit b;
  rand bit cin;
  bit sum, carry;
  
  function void display (string class_name);
    $display("---------------------------");
    $display("---------------------------");
    $display("%s", class_name);
    $display("---------------------------");
    $display("a = %b | b = %b | cin = %b", a, b, cin);
    $display("sum = %b | carry = %b ", sum, carry);
    $display("-------------------------------------");
  endfunction

endclass
