`timescale 1ns / 1ps

module Anode_Driver(
    input reset,
    input clk_en,
    output reg [1:0] s,
    output reg [3:0] an
    );
    
    initial begin
        s <= 0;
    end
    
    always @(posedge clk_en or posedge reset)
        if (reset) begin
            s <= 0;
        end
        else begin
            s <= s + 1;
        end
        
    always @(s)
        case (s)
            2'b00 : an <= 4'b1110;
            2'b01 : an <= 4'b1101;
            2'b10 : an <= 4'b1011;
            2'b11 : an <= 4'b0111;
        endcase
endmodule
