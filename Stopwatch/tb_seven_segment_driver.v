`timescale 1ns / 1ps
/*
Testbench for Seven Segement Driver module

Test procedure
*** SECONDS ***
1. Set register (0-59)
2. Wait for propagation
3. Wait for 10's place anode to go LOW
4. Check display_out to make sure it matches the 10's place of the input number
5. Wait for 1's place anode to go LOW
6. Check display_out to make sure it matches 1's place of input #
7. Move to next number

*** MINUTES ***
Same procedure for seconds but input range is 0-99

*** NOTES ***
Apparently you can only assign values inside initial begin blocks in testbenches??
*/

module tb_seven_segment_driver;

    // Inputs 
    reg clock;
    reg reset;
    reg [6:0] minutes;
    reg [6:0] seconds;

    // Outputs
    wire [3:0] anode_signals;
    wire [6:0] display_out;

    // Design under test
    seven_segment_driver dut (
        .clock(clock),
        .reset(reset),
        .minutes(minutes),
        .seconds(seconds),
        .anode_signals(anode_signals),
        .display_out(display_out)
    );

	// Build array of correct outputs for decimal 1-9
	// Each bit corresponds to a different cathode on the 7 segment display (1 = OFF, 0 = ON)
    reg [0:6] test_cases [9:0];
    

    // Generate 50Mhz clock signal
    always #10 clock = ~clock;

    // Block to check the value of display_out depending on which digit is enabled
	// Changed to run at every clock cycle to avoid infinite loop?
	always @(posedge clock) begin
		case (anode_signals)
			// 10's place of the seconds input
			4'b1101:
			begin
				if (display_out != test_cases[(seconds / 10)]) begin
					$display("10's place of the seconds input doesn't match expected value\tdisplay_out = %b expected: %b", display_out, test_cases[(seconds / 10)]);
				end else begin
					$display("10's place of the seconds input has the correct value.");
				end
			end
						
			// 1's place of the seconds input
			4'b1110:
			begin
				if (display_out != test_cases[(seconds % 10)]) begin
					$display("1's place of the seconds input doesn't match expected value\tdisplay_out = %b expected: %b", display_out, test_cases[(seconds % 10)]);
				end else begin
					$display("1's place of the seconds input has the correct value.");
				end
			end
						
			// 10's place of minutes input
			4'b0111:
			begin
				if (display_out != test_cases[(minutes / 10)]) begin
					$display("10's place of the minutes input doesn't match expected value\tdisplay_out = %b expected: %b", display_out, test_cases[(minutes / 10)]);
				end
			end
					
			// 1's place of minutes input
			4'b1011:
			begin
				if (display_out != test_cases[(minutes / 10)])
				begin
					$display("1's place of the minutes input doesn't match expected value\tdisplay_out = %b expected: %b", display_out, test_cases[(minutes % 10)]);
				end
			end				
		endcase
	end
	
	// Number used to test the inputs
	reg [6:0] test_number;

    // Generate stimulus
    initial begin
        // Initialize inputs
        reset <= 1;
        clock <= 0;
        minutes <= 4'b0000;
        seconds <= 4'b0000;

        // Start the 7 segment driver
        #5 reset <= 0;
		
		// Initialize test cases
		test_cases[0] = 7'b0000001; // 0
		test_cases[1] = 7'b1001111; // 1
		test_cases[2] = 7'b0010010; // 2
		test_cases[3] = 7'b0000110; // 3
		test_cases[4] = 7'b1001100; // 4
		test_cases[5] = 7'b0100100; // 5
		test_cases[6] = 7'b0100000; // 6
		test_cases[7] = 7'b0001111; // 7
		test_cases[8] = 7'b0000000; // 8
		test_cases[9] = 7'b0000100; // 9

        // Generate stimulus

        // Test the seconds input
        test_number = 7'd0;
        repeat (60) begin
			#10; // Propagation delay (does this need to be synced with the clock?)
            seconds <= test_number;
            test_number <= test_number + 1;
        end
		
		seconds <= 7'd0;

        // Test the minutes input
        test_number = 8'd0;
		repeat (100) begin
			#10; // Propagation delay
            minutes <= test_number;
            test_number <= test_number + 1;
        end
    end
endmodule