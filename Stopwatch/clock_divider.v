`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:36:18 09/22/2022 
// Design Name: 
// Module Name:    clock_divider 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module clock_divider(
    input clock,
    output reg new_clock
    );

    reg[27:0] counter = 28'd0;
    parameter DIVISOR = 28'd50000000; // Divide by 50,000,000 to get 1Hz clock from 50Mhz FPGA clock

    always @(posedge clock)
    begin
        counter <= counter + 28'd1;


        if (counter >= (DIVISOR - 1))
            counter <= 28'd0;

        if (counter < (DIVISOR / 2)) // Clock has a 50% duty cycle
            new_clock <= 1'b1; // Output is on for first half of cycle
        else
            new_clock <= 1'b0; // Output is off for second half of cycle
    
    end
endmodule
