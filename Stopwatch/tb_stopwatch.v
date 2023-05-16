`timescale 1ns/1ps
/////////////////////////////////////////////
// Testbench for the stopwatch top level module
/////////////////////////////////////////////

module tb_stopwatch;

	// Inputs
	reg clock;
	reg start;
	reg stop;
	reg reset;
	
	// Outputs
	reg [3:0] anode_signals;
	reg [6:0] display_out;
	
	// Design under test
	stopwatch dut(
		.clk(clock),
		.button_start(start),
		.button_stop(stop),
		.button_reset(reset),
		.anode_signals(anode_signals),
		.display_out(display_out)
	);
	
	// Generate 50Mhz clock signal
    always #10 clock = ~clock;
	
	

endmodule

