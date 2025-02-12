class packet;
  randc bit [3:0] mode;
  randc bit [7:0] header;
  rand bit [7:0] key;
  rand bit [3:0] address;
  
  constraint m_ran { mode inside  {[3:14]}; }
  constraint k_ran { key inside {2, 7, 45, 63}; }
  constraint h_ran { header inside {[1:63]}; }
  constraint a_ran { address == 7; }
                    
  function void display();
    $display("mode = %b, %0d | key = %b, %0d | header = %b, %0d | address = %0d", mode, mode, key, key, header, header, address);
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
