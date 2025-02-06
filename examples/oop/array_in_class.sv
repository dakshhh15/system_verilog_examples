class numb;
  bit [5:0] pincode;
  bit [9:0] cellular;
  bit mode;
  bit stop;
  
  function new ( bit [5:0] pincode = 6'b001001, bit [9:0] cellular = 10'b0101011010);
    this.pincode = pincode;
    this.cellular = cellular;
    this.mode = 1;
    this.stop = 0;
  endfunction
  
  function void display ();
    $display("pin=%b,%0h | cell=%b,%0h | mode=%0b | stop=%0b", this.pincode, this.pincode, this.cellular, this.cellular, this.mode, this.stop);
  endfunction
  
endclass

module test;
  numb n [3];

  initial 
    begin
      for(int i = 0; i<4; i++)
        begin
	  n[i] = new ();
	  n[i].display();
	  #10;
	end
    end
endmodule
