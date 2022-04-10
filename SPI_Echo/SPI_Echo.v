`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:03:29 04/05/2022 
// Design Name: 
// Module Name:    SPI_Echo 
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
// Doesn't actually work, not sure how to debug it
//////////////////////////////////////////////////////////////////////////////////
module SPI_Echo(
    input wire MOSI,
    output reg MISO,
    input SCLK,
    input CS
    );

    always @(posedge SCLK) begin
        // Only do SPI stuff is chip select (CS) is low
        if (!CS) begin
            MISO <= MOSI; // Echo bits received by the master
        end
    end

endmodule
