// w virtual keyword
class packet;
  int address;
  
  function new (int address);
    this.address = address;
  endfunction
  
  virtual function void display();
    $display("[%0t] address = %h | %0d", $time, address, address);
  endfunction
endclass

class ext_packet extends packet;
  int data;
  
  function new (int address, data);
    super.new(address);
    this.data = data;
  endfunction
  
  function void display();
    $display("[%0t] address = %h | %0d || data = %h | %0d", $time, address, address, data, data);
  endfunction
endclass

module tb;
  packet bc;
  ext_packet sc;
  
  initial
    begin      
      sc = new (32'h1111ffff, 32'hffffaaaa);
      bc = sc;
      bc.display ();
	end
endmodule

//w/o virtual keyword
class packet;
  int address;
  
  function new (int address);
    this.address = address;
  endfunction
  
  function void display();
    $display("[%0t] address = %h | %0d", $time, address, address);
  endfunction
endclass

class ext_packet extends packet;
  int data;
  
  function new (int address, data);
    super.new(address);
    this.data = data;
  endfunction
  
  function void display();
    $display("[%0t] address = %h | %0d || data = %h | %0d", $time, address, address, data, data);
  endfunction
endclass

module tb;
  packet bc;
  ext_packet sc;
  
  initial
    begin      
      sc = new (32'h1111ffff, 32'hffffaaaa);
      bc = sc;
      bc.display ();
	end
endmodule
    
