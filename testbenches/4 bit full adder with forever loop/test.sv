`include "environment.sv"

program test (int1 intf);
  
  environment env;
  
  initial
    begin
      env = new(intf);
      env.gen.count1 = 5;
      env.run();
    end
 
endprogram
