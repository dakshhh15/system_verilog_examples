class packet;
  rand bit [3:0] mode;
  randc bit [3:0] key;
  
  constraint mode_1 { mode < 13; }
  constraint key_1 { key > 2;
                    key < 25; }
  
  
  function void display();
    $display("mode = %b, %0d | key = %b, %0d", mode, mode, key, key);
  endfunction
endclass
  
module tb;
  packet pkt;
  
  initial
    begin
      pkt = new ();
      
      for (int i = 0; i<31; i++)
        begin
          assert (pkt.randomize ());
          pkt.display;
        end
    end
endmodule
