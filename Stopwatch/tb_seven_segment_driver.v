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

    // Design under test
    seven_segment_driver dut (
        .clock(clock),
        .reset(reset),
        .minutes(minutes),
        .seconds(seconds),
        .anode_signals(anode_signals),
        .display_out(display_out)
    );

    // Generate 50Mhz clock signal
    always #10 clock = ~clock;

    // Build array of correct outputs for decimal 1-9
    reg [6:0] test_cases [0:10];
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

    // Blocks to check the value of display_out depending on which digit is enabled
    

    // Generate stimulus
    initial begin
        // Initialize inputs
        reset <= 1;
        clock <= 0;
        minutes <= 4'b0000;
        seconds <= 4'b0000;

        // Start the 7 segment driver
        #10 reset <= 0;

        // Wait for global reset
        #20

        // Generate stimulus

        // Test the seconds input
        reg [5:0] test_number = 6'd0;
        repeat(60)
        begin
            seconds <= test_number;
            #5; // Propagation delay
            test_number <= test_number + 1;
        end

        // Test the minutes input
        test_number = 6'd0;
        begin
            seconds <= test_number;
            #5; // Propagation delay
            test_number <= test_number + 1;
        end
    end
endmodule