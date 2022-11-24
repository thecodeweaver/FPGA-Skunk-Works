`timescale 1ns / 1ns
////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   21:21:59 11/23/2022
// Design Name:   clock_divider
// Project Name:  Stopwatch
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: clock_divider
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module tb_clock_divider;

	// Inputs
	reg clock;

	// Outputs
	wire new_clock;

	// Instantiate the Unit Under Test (UUT)
	clock_divider uut (
		.clock(clock), 
		.new_clock(new_clock)
	);

	initial begin
		// Initialize Inputs
		clock = 1'b0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		// Generate 50Mhz clock with 50% duty cycle
		// Signal has a 20 ns period
		// 1e9 ns in 1 s, divide by desired clock to get period of signal
		forever #10 clock = ~clock;
	end
      
endmodule

