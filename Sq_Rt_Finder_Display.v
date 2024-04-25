`timescale 1ns / 1ps

module Sq_Rt_Finder_Display(
    input wire  clk, clr, start,                // timing inputs
                [7:0] data,                     // data input
    output wire [3:0] an,
 [6:0] ca              // display outputs
);

    wire [3:0] sqrt;                            // data output
    wire [9:0] bcd_digs;
    
    Sq_Rt_Finder_Top sqrt_finder(.clk(clk),
                                 .clr(clr),
                                 .start(start),
                                 .a(data),
                                 .sqrt(sqrt));
                                 
    Binary8_To_BCD bcd(.b(start ? sqrt : data),
                       .p(bcd_digs));
                       
    Display display(.clk(clk),
                    .clr(clr),
                    .dig1(0),
                    .dig2(bcd_digs[9:8]),
                    .dig3(bcd_digs[7:4]),
                    .dig4(bcd_digs[3:0]),
                    .an(an),
                    .ca(ca));
    
endmodule
