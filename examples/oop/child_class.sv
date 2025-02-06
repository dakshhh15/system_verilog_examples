class base;
  bit [15:0] data;
  
  function new();
    data = 16'hea18;
  endfunction

endclass

class child extends base;
  bit [3:0] number;
  bit [7:0] address;
  
  function new (int val = 5, int gem = 11);
    super.new();
    
    number = val;
    address = gem;
  endfunction
endclass

module test;
  child c1; 
  child c2 = new (4,35);
  
initial
begin
  c1 = new();
  $display("data=%b,%h | number=%b,%h | address=%b,%h", c1.data, c1.data, c1.number, c1.number, c1.address, c1.address);
  //c2 = new(4);
  $display("data=%b,%h | number=%b,%h | address=%b,%d", c2.data, c2.data, c2.number, c2.number, c2.address, c2.address);
end
endmodule
