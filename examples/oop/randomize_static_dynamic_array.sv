class packet;
  rand bit [4:0] [2:0] array [2];
  rand byte array2 [];

  constraint a2 { array2.size() > 2; array2.size() < 10; }
endclass

module tb;
  packet pkt = new ();
  
  initial
    begin
      for (int i = 0; i<8; i++)
        begin
          pkt.randomize();
          $display("array = %p | array = %p", pkt.array, pkt.array2);
        end
    end
endmodule
