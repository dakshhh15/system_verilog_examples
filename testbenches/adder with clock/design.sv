module adder(
    input logic clk,
    input logic rst,
    input logic valid,
    input logic [3:0] a,
    input logic [3:0] b,
    output logic [4:0] sum);

    always_ff @(posedge clk or posedge rst) begin
        if (rst)
            sum <= 7'd0; 
        else if (valid)
            sum <= a + b; 
    end

endmodule
