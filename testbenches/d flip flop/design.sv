module d_ff (output reg q,
              input d, clk, rst);
  
  always@(posedge clk)
    begin
      if (rst)
        begin
          q <= 0;
        end
      else
        q <= d;
    end
endmodule
