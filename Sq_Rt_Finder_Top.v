`timescale 1ns / 1ps

module Sq_Rt_Finder_Top(
    input wire  clk, clr, start,                // timing inputs
                [7:0] a,                        // data input
    output wire [3:0] sqrt                      // data output
    );
    
    wire en_a, en_del, en_sq, en_out, ld_add;   // from controller to data path
    wire greater;                               // from data path to controller
    
    Controller controller(.clk(clk),
                          .clr(clr),
                          .start(start),
                          .greater(greater),
                          .en_a(en_a),
                          .en_del(en_del),
                          .en_sq(en_sq),
                          .en_out(en_out),
                          .ld_add(ld_add));

    Data_Path data_path(.clk(clk),
                        .clr(clr),
                        .a(a),
                        .en_a(en_a),
                        .en_del(en_del),
                        .en_sq(en_sq),
                        .en_out(en_out),
                        .ld_add(ld_add),
                        .greater(greater),
                        .sqrt(sqrt));
    
endmodule
