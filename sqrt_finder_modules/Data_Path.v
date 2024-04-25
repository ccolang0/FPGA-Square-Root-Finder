`timescale 1ns / 1ps

module Data_Path(
    input wire clk, clr,                                // external timing inputs
               en_a, en_del, en_sq, en_out, ld_add,     // internal inputs from controller
               [7:0] a,                                 // external data input
    output wire greater,                                // outgoing state data to controller
                [3:0] sqrt                              // outgoing data (external)
//    ,output wire [3:0] out_d, out_q
//    ,output wire [7:0] del_d, a_d, del_q, a_q
//    ,output wire [8:0] sq_d, sq_q
);
    
    wire [3:0] out_d, out_q;
    wire [7:0] del_d, del_q, a_d, a_q;
    wire [8:0] sq_d, sq_q;
    
    assign del_d = ld_add ? del_q + 2 : 3;                // if ld_add = 1, then del reg input = (del reg output + 2), else 3
    assign sq_d = ld_add ? sq_q + del_q : 1;            // if ld_add = 1, then sq reg input = (sq reg output + 2), else 1
    assign out_d = (del_q >> 1) - 1;                    // out reg input = (del reg output)/2
    assign a_d = a;                                     // a reg input = a

    assign sqrt = out_q;
    assign greater = a_q < sq_q;    // STOP condition

    D_Latch_Reg #(8) del_reg (.clk(clk),
                              .clr(clr),
                              .en(en_del),
                              .d(del_d),
                              .q(del_q));
    
    D_Latch_Reg #(4) out_reg(.clk(clk),
                             .clr(clr),
                             .en(en_out),
                             .d(out_d),
                             .q(out_q));

    D_Latch_Reg #(9) sq_reg(.clk(clk),
                            .clr(clr),
                            .en(en_sq),
                            .d(sq_d),
                            .q(sq_q));
    
    D_Latch_Reg #(8) a_reg(.clk(clk),
                           .clr(clr),
                           .en(en_a),
                           .d(a_d),
                           .q(a_q));
    
endmodule
