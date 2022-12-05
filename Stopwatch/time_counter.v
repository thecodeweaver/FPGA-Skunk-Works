`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:42:42 09/22/2022 
// Design Name: 
// Module Name:    time_counter 
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
module time_counter(
    input wire clock,
	input wire reset,
    input wire hold_clock,
    output reg [5:0] minutes,
    output reg [5:0] seconds
    );
    
    always @(posedge clock)
    begin

        if (!hold_clock)
        begin
           if (reset) // Set minutes and seconds to 0 if reset signal is high
            begin
                minutes <= 0;
                seconds <= 0;
            end
            else
            begin
                seconds <= seconds + 1;

                if (minutes == 61) // Reset when at 60 minutes, 59 seconds
                begin
                    minutes <= 0;
                    seconds <= 0;
                end

                if (seconds == 59) // Reset seconds counter and add to minute counter every 60 seconds
                begin
                    seconds <= 0;
                    minutes <= minutes + 1;
                end
            end 
        end
    end
endmodule
