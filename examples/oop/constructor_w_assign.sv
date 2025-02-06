class packet;
  bit [15:0] mode;
  
  function new ();
    mode = 16'hfe23;
  endfunction
  
  function void display();
    $display("mode = %b,%h", this.mode, this.mode);
  endfunction
  
endclass

module test;
  packet p1 = new;
  
  initial
    begin
      p1.display;
    end
endmodule
