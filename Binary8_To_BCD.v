`timescale 1ns / 1ps

module Binary8_To_BCD(
// Declare input and out ports 
    input wire [7:0]  b, // 8-bit vector for the input b, of type wire. 
    output reg [9:0]  p // 10-bit vector for the output p, of type wire.
); 

    // Declare intermediate variables. 
    reg [17:0] z; // 18-bit vector for intermediate operations. 
    integer i;  // Loop control variable.
    
    always @(*)
    begin
        for( i = 0; i <= 17; i = i +1)
            z[i] = 0; //Clear/initialized vector z to zeros. 
        z[10:3] = b; // Shifts b 3 places left corresponding to shift 1, shift 2, and shift 3. 
// So, we have 5 more shifts remaining to reach the 8 shits described by the algorithm. 
        repeat(5)  // execute 5 more times to reach 8 shifts. 
        begin
            if(z[11:8] > 4) // Value in units is 5 or more.
                z[11:8] = z[11:8] + 3; // Add 3 to the units value. Units z array indices are between 11 and 8, see Fig 2.
            if(z[15:12] > 4) //Value in tens is 5 or more. Tens z array indices are between 15 and 12, see Fig 2.
                z[15:12] = z[15:12] + 3; // Add 3 to the Tens value. 
            z[17:1] = z[16:0]; // shift z 1 bit left. Last of the 8 shifts. 
        end
     p = z[17:8];  // BCD output corresponding to shift 8 in Fig. 2;  Indices of array z containing the 
                   // BCD binary values are between 17 and 8.  
 end

    
endmodule
