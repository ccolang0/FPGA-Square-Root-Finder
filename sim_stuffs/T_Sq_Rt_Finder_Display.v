`timescale 1ns / 1ps

module T_Sq_Rt_Finder_Display;

    reg clk, clr, start;
    reg [7:0] a;
    wire [3:0] an;
    wire [6:0] ca;
    wire [3:0] sqrt;
    wire [9:0] bcd_digs;
    wire [7:0] b;
    wire [3:0] dig1, dig2, dig3, dig4;

    Sq_Rt_Finder_Display M_UUT_sqrt_disp(.clk(clk),
                                         .clr(clr),
                                         .start(start),
                                         .data(a),
                                         .an(an),
                                         .ca(ca)
                                         ,.sqrt(sqrt)
                                         ,.bcd_digs(bcd_digs)
                                         ,.b(b)
                                         ,.dig1(dig1)
                                         ,.dig2(dig2)
                                         ,.dig3(dig3)
                                         ,.dig4(dig4)
                                         );
    
    always #2 clk = ~clk;
    
    initial begin
    
        clk = 0; clr = 0; a = 0; start = 0;
        
        #2  clr = 1;
        #2  clr = 0;

//        #1  start = 1;
//        #10 start = 0;
        
    end
    
    integer k = 36;
    initial begin
    
        #5      a <= 0;
                start = 1;
        #2      start = 0;
        
        #50     a <= 36;
                start = 1;
        #2      start = 0;
        
        #50     a <= 150;
                start = 1;
        #2      start = 0;
        
        #100    a <= 255;
                start = 1;
        #2      start = 0;
        

//            while(1) begin
//                #100 a <= k;
//                k = k + 2;
//            end

//        #5      a <= 255;

        #100    $finish;
        
    end

endmodule
