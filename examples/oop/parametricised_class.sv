class par_class #(int num = 8);
  bit [num-1:0] out;
endclass

module tb;
  
  par_class #(12) inst1;
  par_class #(6) inst2;
  typedef par_class #(4) inst3;
  
  inst3 nibble;
  
  initial
    begin
      inst1 = new();
      inst2 = new();
      nibble = new();
      
      $display("inst1 size = %0d", $bits(inst1.out));
      $display("inst2 size = %0d", $bits(inst2.out));
      $display("inst3 size = %0d", $bits(nibble.out));
    end
  
endmodule
