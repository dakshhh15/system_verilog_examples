module d (output reg [3:0] q,
                            input [3:0] d,
                            input clk,clr, sl, sr,
                            input [1:0] s);
  always@(posedge clk)
    begin
      if (clr)
        q <= 0;
      else
        case(s)
          2'b00 : q <= q;
          2'b01 : begin q <= q >> 1; q[3]<=sr;  end
          2'b10 : begin q <= q << 1; q[0]<=sl; end
          2'b11 : q <= d; 
          default : ;
        endcase
    end
  
endmodule
