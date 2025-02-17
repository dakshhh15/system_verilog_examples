class abc;
  rand logic [3:0] data;
  rand logic [3:0] data2;
  
  constraint abc_c { data == 2 -> data2 < 7; }
  
endclass

module tb;
  initial
    begin
      abc t1 = new ();
      repeat (20)
        begin
          t1.randomize();
          $display("data = %d | data = %d", t1.data, t1.data2);
        end
    end
endmodule
