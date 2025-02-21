class packet;
  
  rand byte array [$];
  
  constraint a1 { array.size > 1; array.size <5; }
  
  
  function void display();
    $display("array = %p", array);
  endfunction
  
endclass

module tb;
  packet pkt = new ();
  
  initial
    begin
      pkt.randomize();
      pkt.display();

      pkt.randomize();
      pkt.display();
    end
endmodule
