`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   02:16:30 04/06/2022
// Design Name:   SPI_Echo
// Module Name:   C:/Users/theco/Documents/FPGA Projects/SPI_Echo/SPI_Echo_Testbench.v
// Project Name:  SPI_Echo
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: SPI_Echo
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module SPI_Echo_Testbench;

	// Inputs
	reg MOSI;
	reg SCLK;
	reg CS;

	// Outputs
	wire MISO;

	// Instantiate the Unit Under Test (UUT)
	SPI_Echo uut (
		.MOSI(MOSI), 
		.MISO(MISO), 
		.SCLK(SCLK), 
		.CS(CS)
	);

	// Clock signal generation
	initial begin
		SCLK = 0;
		forever #1 SCLK = ~SCLK;
	end

	initial begin
		// Initialize Inputs
		MOSI = 0;
		CS = 0;

		// Wait 100 ns for global reset to finish
		//#100;
        
		// Add stimulus here
		// Generate SPI signal
		MOSI = 1;
		#10;
		$display("MISO has value: %b\n", MISO);
		
		if (!MISO) begin
			$display("MISO has incorrect value: %b\n", MISO);
		end

		MOSI = 0;
		#10;
		$display("MISO has value: %b\n", MISO);

		if (MISO) begin
			$display("MISO has incorrect value: %b\n", MISO);
		end

		MOSI = 1;
		#10;
		$display("MISO has value: %b\n", MISO);

		if (!MISO) begin
			$display("MISO has incorrect value: %b\n", MISO);
		end

	end
      
endmodule

