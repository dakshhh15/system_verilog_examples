class packet;
  randc bit [3:0] mode;
  
  constraint m_ran { ! (mode inside  {[3:6]}); }
                    
  function void display();
    $display("mode = %b, %0d ", mode, mode);
  endfunction
endclass
  
module tb;
  packet pkt;
  
  initial
    begin
      pkt = new ();
      
      for (int i = 0; i<15; i++)
        begin
          pkt.randomize ();
          pkt.display;
        end
    end
endmodule
