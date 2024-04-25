`timescale 1ns / 1ps

module Display(
    input clk,
    input clr,
    input [3:0] dig1,
    input [3:0] dig2,
    input [3:0] dig3,
    input [3:0] dig4,
    output [3:0] an,
    output [6:0] ca
    );
    
    wire clk_en;
    wire [1:0] s;
    reg [3:0] x;
    
    // wire connections between modules
    Clock_Enable clock(.clk(clk),
                       .clr(clr),
                       .clk_en(clk_en));

    Anode_Driver an_drive(.clk_en(clk_en),
                          .reset(clr),
                          .s(s),
                          .an(an) );
                          
    Hex_To_Sev_Seg hex_decoder(.x(x),
                               .ca(ca) );
                               
    // 4x1 MUX to send correct dig to hex decoder
    always @(*)
        case (s)
            2'b00 : x = dig4;  // rightmost
            2'b01 : x = dig3;
            2'b10 : x = dig2;
            2'b11 : x = dig1;  // leftmost
        endcase 
        
endmodule
