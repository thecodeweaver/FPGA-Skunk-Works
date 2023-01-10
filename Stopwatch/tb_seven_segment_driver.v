`timescale 1ns / 1ps
/*
Testbench for Seven Segement Driver module
*/

module tb_seven_segment_driver;

    // Inputs 
    reg clock;
    reg reset;
    reg [5:0] minutes;
    reg [5:0] seconds;

    // Outputs
    wire [3:0] anode_signals;
    wire [6:0] display_out;

    
endmodule