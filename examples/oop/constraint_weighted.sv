class packet;
  randc bit [3:0] mode;
  randc bit [3:0] key;
  
  //total prob = 20+20+60+(6*80) (each in 9-14 has 80)
  constraint m_ran { mode dist { 0:=20, 3:=20, 6:=60, [9:14]:=80 }; }
  //total prob = 20+20+60+80  (each in 9-14 has 6/80)
  constraint k_ran { key dist { 0:/20, 3:/20, 6:/60, [9:14]:/80 }; }
                    
  function void display();
    $display("mode = %b, %0d | key = %b, %0d ", mode, mode, key, key);
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
