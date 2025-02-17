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
          assert t1.randomize();
          $display("data = %d | data = %d", t1.data, t1.data2);
        end
    end
endmodule

-------------------------------------------------------------------------------

class abc;
  rand logic [7:0] data;
  rand logic [7:0] data2;
  
  constraint abc_c { data == 2 -> data2 < 15; }
  
endclass

module tb;
  initial
    begin
      abc t1 = new ();
      repeat (20)
        begin
          //warning of randomize used as a void cast
          t1.randomize();
          $display("data = %d | data = %d", abc.data, abc.data2);
          //work arounds are:
          
          /*if (t1.randomize())
            $display("data = %d | data2 = %d", t1.data, t1.data2);
      	  else
        	$display("Randomization failed!");*/
          
          /*assert (t1.randomize());
			$display("data = %d | data2 = %d", t1.data, t1.data2);*/
        end
    end
endmodule
