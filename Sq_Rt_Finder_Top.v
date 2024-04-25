`timescale 1ns / 1ps

module Sq_Rt_Finder_Top(
    input wire  clk, clr, start,                // timing inputs
                [7:0] a,                        // data input
    output wire [3:0] sqrt                      // data output
//    ,output wire en_a, en_del, en_sq, en_out, ld_add
//    ,output wire greater
//    ,output wire [1:0] pres, next
//    ,output wire [3:0] out_d, out_q
//    ,output wire [7:0] del_d, a_d, del_q, a_q
//    ,output wire [8:0] sq_d, sq_q
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
                          .ld_add(ld_add)
//                          ,.pres(pres),
//                           .next(next)
                          );

    Data_Path data_path(.clk(clk),
                        .clr(clr),
                        .a(a),
                        .en_a(en_a),
                        .en_del(en_del),
                        .en_sq(en_sq),
                        .en_out(en_out),
                        .ld_add(ld_add),
                        .greater(greater),
                        .sqrt(sqrt)
//                        ,.del_d(del_d),
//                         .out_d(out_d),
//                         .sq_d(sq_d),
//                         .a_d(a_d),
//                         .del_q(del_q),
//                         .out_q(out_q),
//                         .sq_q(sq_q),
//                         .a_q(a_q)
                        );
    
endmodule
