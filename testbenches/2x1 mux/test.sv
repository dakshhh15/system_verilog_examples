`include "environment.sv"

program test (int1 intf);
  
  environment env;
  int par_c = 3;
  
  initial
    begin
      env = new (intf);
      env.gen.count = par_c;
      env.driv.count = par_c;
      env.mon.count = par_c;
      env.sb.count = par_c;
      env.run ();
    end
  
endprogram
