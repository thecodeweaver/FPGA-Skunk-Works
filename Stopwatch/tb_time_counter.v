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

	// Outputs
	wire [5:0] minutes;
	wire [5:0] seconds;

	// Instantiate the Unit Under Test (UUT)
	time_counter uut (
		.clock(clock), 
		.reset(reset), 
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

		// Wait 20 ns for global reset to finish
		#20;
        
		// Add stimulus here
		reset <= 0; // Set reset to 0 which starts the counting process
	end
      
endmodule

