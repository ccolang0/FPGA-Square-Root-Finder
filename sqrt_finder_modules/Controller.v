`timescale 1ns / 1ps

module Controller(
    input wire clk, clr, start,                         // external timing inputs
               greater,                             // internal inputx from data path
    output reg en_a, en_del, en_sq, en_out, ld_add      // outgoing enable signals to data path
//    ,output reg [1:0] pres, next
);
    
    // State variables and values
    reg [1:0] pres, next;
    parameter idle = 2'b00, load = 2'b01, add = 2'b10, done = 2'b11;
    
    // State registers update block
    always @(negedge clk or posedge clr) begin
        if (clr)
            pres <= idle;
        else
            pres <= next;
    end
    
    // Next State combinational logic -- implementing state diagram
    always @(*) begin
        case (pres)
            idle:   next <= start ? load : idle;
            load:   next <= greater ? done : add;
            add:    next <= greater ? done : add;
            done:   next <= idle;
        endcase
    end
    
    // Output combinational logic -- using Moore machine state diagram
    always @(*) begin
        en_a = 0; en_del = 0; en_sq = 0; en_out = 0; ld_add = 0;
        case (pres)
            idle:   ;
            load:   begin
                        en_a = 1;
                        en_del = 1;
                        en_sq = 1;
                    end
            add:    begin
                        en_a = 1;
                        en_del = 1;
                        en_sq = 1;
                        ld_add = 1;
                    end
            done:   begin
                        en_a = 1;
                        en_del = 1;
                        en_sq = 1;
                        en_out = 1;
                    end
        endcase
    end
    
endmodule