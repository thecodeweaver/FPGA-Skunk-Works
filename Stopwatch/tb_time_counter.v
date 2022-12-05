`timescale 1ns / 1ps
////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:51:14 11/26/2022
// Design Name:   time_counter
// Project Name:  Stopwatch
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: time_counter
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module tb_time_counter;

	// Inputs
	reg clock;
	reg reset;
	reg hold_clock;

	// Outputs
	wire [5:0] minutes;
	wire [5:0] seconds;

	// Instantiate the Unit Under Test (UUT)
	time_counter uut (
		.clock(clock), 
		.reset(reset),
		.hold_clock(hold_clock), 
		.minutes(minutes), 
		.seconds(seconds)
	);

	// Generate clock
	always #1 clock = ~clock;

	initial 
	begin
		// Initialize Inputs
		reset <= 1; // Reset initialized to 1 to make sure the counter initializes properly
		clock <= 0;
		hold_clock <= 0;

		// Wait 20 ns for global reset to finish
		#20;
        
		// Add stimulus here
		reset <= 0; // Set reset to 0 which starts the counting process
		#250; // Let the counter count for a bit
		hold_clock <= 1;
		#100; // Make sure the count is held at it's current value
		hold_clock <= 0; // Continue the counting process
		#250;
		reset <= 1; // Reset the counter
		#10;
		reset <= 0; // Start the count from the beginning
	end
      
endmodule

