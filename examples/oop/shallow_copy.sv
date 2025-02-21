class header;
  int id;
  
  function new (int id);
    this.id = id;
  endfunction
  
  function void show_id ();
    $display("id = %0d", this.id);
  endfunction
  
endclass

class packet;
  int address;
  int data;
  header hdr;
  
  function new (int adr, int d, int id);
    this.address = adr;
    this.data = d;
    hdr = new(id);
  endfunction
  
  function display(string name);
    $display("[%s] address = 0x%0h data = 0x%0h | id = %0d", name, address, data, hdr.id);
  endfunction
endclass

module tb;
  packet p1, p2;
  
  initial
    begin
      p1 = new(32'hffff1111, 32'h11111111, 25);
      p1.display("p1");
      
      p2 = new p1;
      
      p1.display("p1");
      p2.display("p2");
      
      p2.address = 32'haabbccdd;
      p2.data = 32'h5a5a5a5a;
      p2.hdr.id = 17;
      
      p1.display ("p1");
      p2.display ("p2");
    end
endmodule
