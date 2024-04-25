`timescale 1ns / 1ps

module D_Latch_Reg #(parameter N = 4)(
    input wire clk, clr, en,    // external timing/enable inputs
               [N-1:0] d,         // data input
    output reg [N-1:0] q          // data output
);
    
    always @(posedge clr or posedge clk) begin
        if (clr)
            q = 0;
        else if (en)
            q <= d;
        end
    
endmodule
