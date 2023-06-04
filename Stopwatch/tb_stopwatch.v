`timescale 1ns/1ps
/////////////////////////////////////////////
// Testbench for the stopwatch top level module
/////////////////////////////////////////////

module tb_stopwatch;

	// Inputs
	reg clock;
	reg hold_count;
	reg reset;
	
	// Outputs
	wire [3:0] anode_signals;
	wire [6:0] display_out;
	
	// Design under test
	stopwatch dut(
		.clk(clock),
		.hold_count_switch(hold_count),
		.button_reset(reset),
		.anode_signals(anode_signals),
		.display_out(display_out)
	);
	
	// Generate extra fast clock signal to reduce simulation time
	// 800 Mhz clock signal
    always #0.625 clock = ~clock;
	
	initial begin
		// Initialize inputs
		clock <= 0;
		hold_count <= 0;
		reset <= 1;

		// Propogation delay
		#5;

		// Start counting
		reset <= 0;

		// Let the design run
		#10000;
	end

endmodule

