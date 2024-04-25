`timescale 1ns / 1ps

module Sq_Rt_Finder_Display(
    input wire  clk, clr, start,                // timing inputs
                [7:0] data,                     // data input
    output wire [3:0] an, [6:0] ca              // display outputs
//    ,output wire [3:0] sqrt                            // data output
//    ,output wire [9:0] bcd_digs
//    ,output wire [7:0] b
//    ,output wire [3:0] dig1, dig2, dig3, dig4
);

    wire [3:0] sqrt;                            // data output
    wire [9:0] bcd_digs;
//    wire [3:0] dig1, dig2, dig3, dig4;
    reg b;

    always @(posedge start or posedge clr) begin
        if (clr)
            b <= data;
        else
            b <= {4'b0000, sqrt};
    end
//    assign dig1 = 0;
//    assign dig2 = bcd_digs[9:8];
//    assign dig3 = bcd_digs[7:4];
//    assign dig4 = bcd_digs[3:0];
    
    Sq_Rt_Finder_Top sqrt_finder(.clk(clk),
                                 .clr(clr),
                                 .start(start),
                                 .a(data),
                                 .sqrt(sqrt));
                                 
    Binary8_To_BCD bcd(.b(b),
                       .p(bcd_digs));
                       
    Display display(.clk(clk),
                    .clr(clr),
                    .dig1(4'b0000),
                    .dig2(bcd_digs[9:8]),
                    .dig3(bcd_digs[7:4]),
                    .dig4(bcd_digs[3:0]),
//                     .dig1(dig1)
//                    ,.dig2(dig2)
//                    ,.dig3(dig3)
//                    ,.dig4(dig4),
                    .an(an),
                    .ca(ca));
    
endmodule
