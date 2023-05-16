`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:31:33 09/22/2022 
// Design Name: 
// Module Name:    stopwatch 
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
module stopwatch(
    input clk,
    input button_start,
    input button_stop,
	input button_reset,
	output [3:0] anode_signals,
	output [6:0] display_out
);

	// Wires to connect stopwatch components
	wire counter_clock;
	wire [6:0] minutes_bus, seconds_bus;
	
	// Instantiate and connect component modules
	clock_divider divider(
		.clock(clk),
		.new_clock(counter_clock)
	);
	
	time_counter counter(
		.clock(counter_clock),
		.reset(button_reset),
		.hold_count(button_stop),
		.minutes(minutes_bus),
		.seconds(seconds_bus)
	);
	
	seven_segment_driver display_driver(
		.clock(clk),
		.reset(button_reset),
		.minutes(minutes_bus),
		.seconds(seconds_bus),
		.anode_signals(anode_signals),
		.display_out(display_out)
	);

endmodule
