`include "environment.sv"

program test (int1 intf);
  
  environment env;
  
  initial
    begin
      env = new (intf);
      env.run;
    end
  
endprogram
