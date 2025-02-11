class packet;
  bit [7:0] address, data;
  static int st_count;
  int count;
  
  function new (bit [7:0] ad, bit [7:0] d);
    this.address = ad;
    this.data = d;
    st_count++;
    count++;
  endfunction
  
  function void display ();
    $display("[%0t] st_count = %0d | count = %0d | ad = %0h data = %0h", $time,st_count,count,address,data);
  endfunction
endclass

module tb;
  packet p1, p2, p3;
  
  initial 
    begin
      p1 = new (8'b10101001, 8'b11110000);
      p1.display();
      p2 = new (8'b10110011, 8'b00010101);
      p2.display();
      p3 = new (0,0);
      p3.display();
    end
  
endmodule
