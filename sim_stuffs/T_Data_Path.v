`timescale 1ns / 1ps

module T_Data_Path;

    reg clk, clr;                               // timing inputs
    reg [7:0] a;                                // data input
    reg en_a, en_del, en_sq, en_out, ld_add;    // from controller to data path
    wire greater;                               // from data path to controller
    wire [3:0] sqrt;                            // data output
    wire [3:0] del_d, out_d, del_q, out_q;
    wire [7:0]  sq_d, a_d, sq_q, a_q;
    
    reg flag = 1;

    Data_Path data_path(.clk(clk),
                        .clr(clr),
                        .a(a),
                        .en_a(en_a),
                        .en_del(en_del),
                        .en_sq(en_sq),
                        .en_out(en_out),
                        .ld_add(ld_add),
                        .greater(greater),
                        .sqrt(sqrt),
                        .del_d(del_d),
                        .out_d(out_d),
                        .sq_d(sq_d),
                        .a_d(a_d),
                        .del_q(del_q),
                        .out_q(out_q),
                        .sq_q(sq_q),
                        .a_q(a_q));

    always #2 clk = ~clk;
    
    always #1
        if (greater & flag) begin
            flag = 0;
            en_out <= 1;
            #5  en_out <= 0;
        end
    
    initial begin
    
        clk = 0; clr = 0; a = 0;
        en_a = 0; en_del = 0; en_sq = 0; en_out = 0; ld_add = 0;
        
        #2  clr = 1;
        #2  clr = 0;
        
        #4  a = 10;
        
        #4  en_a = 1;
            en_del = 1;
            en_sq = 1;
            
        #4  ld_add = 1;
        //#4  ld_add = 0;
        
        #20 $finish;
        
    end

endmodule
