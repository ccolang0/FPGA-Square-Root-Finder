`timescale 1ns / 1ps

module T_Sq_Rt_Finder_Top;

    reg clk, clr, start;
    reg [7:0] a;
    wire [3:0] sqrt;
//    wire en_a, en_del, en_sq, en_out, ld_add;
//    wire greater;
//    wire [1:0] pres, next;
//    wire [3:0] out_d, out_q;
//    wire [7:0] del_d, a_d, del_q, a_q;
//    wire [8:0] sq_d, sq_q;

    Sq_Rt_Finder_Top sqrt_finder(.clk(clk),
                                 .clr(clr),
                                 .start(start),
                                 .a(a),
                                 .sqrt(sqrt)
//                                 ,.en_a(en_a),
//                                  .en_del(en_del),
//                                  .en_sq(en_sq),
//                                  .en_out(en_out),
//                                  .ld_add(ld_add),
//                                 ,.greater(greater)
////                                 ,.pres(pres),
////                                  .next(next)
//                                 ,.del_d(del_d),
//                                  .out_d(out_d),
//                                  .sq_d(sq_d),
//                                  .a_d(a_d),
//                                  .del_q(del_q),
//                                  .out_q(out_q),
//                                  .sq_q(sq_q),
//                                  .a_q(a_q)
                                 );
    
    always #2 clk = ~clk;
    
    initial begin
    
        clk = 0; clr = 0; a = 0; start = 0;
        
        #2  clr = 1;
        #2  clr = 0;

        #1  start = 1;
//        #10 start = 0;
        
    end
    
    integer k = 36;
    initial begin
    
        #5      a <= 0;
        #50     a <= 36;
        #50     a <= 150;
        #100    a <= 255;

//            while(1) begin
//                #100 a <= k;
//                k = k + 2;
//            end

//        #5      a <= 255;

        #100    $finish;
        
    end

endmodule
