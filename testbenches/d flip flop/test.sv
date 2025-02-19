`include "environment.sv"

program test (int1 intf);
  
  environment env;
  
  initial
    begin
      env = new(intf);
      env.gen.count1 = 10;
      env.run();
    end
 
endprogram
