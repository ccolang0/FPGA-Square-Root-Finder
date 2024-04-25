`timescale 1ns / 1ps

module Clock_Enable (
    input clk,
    input clr,
    output reg clk_en
    );
    
    integer count = 0;
    
    always @(posedge clk or posedge clr)
        if (clr == 1) begin
            count <= 0;
            clk_en <= 0;
        end
        else if (count == 99999) begin
            count <= 0;
            clk_en <= 1;
        end
        else begin
            count <= count + 1;
            clk_en <= 0;
        end
    
endmodule

