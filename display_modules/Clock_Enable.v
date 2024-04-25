`timescale 1ns / 1ps

module Clock_Enable #(parameter src_freq = 100000000, parameter target_freq = 1000)(
    input clk,
    input clr,
    output reg clk_en
    );
    
    integer count = 0;
    parameter limit = src_freq/target_freq - 1;
    
    always @(posedge clk or posedge clr)
        if (clr == 1) begin
            count <= 0;
            clk_en <= 0;
        end
        else if (count == limit) begin
            count <= 0;
            clk_en <= 1;
        end
        else begin
            count <= count + 1;
            clk_en <= 0;
        end
    
endmodule

