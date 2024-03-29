`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:33:35 12/12/2022 
// Design Name: 
// Module Name:    seven_segment_driver 
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
// Based on code from https://www.fpga4student.com/2017/09/seven-segment-led-display-controller-basys3-fpga.html
//////////////////////////////////////////////////////////////////////////////////
module seven_segment_driver(
    input clock,
    input reset,
    input [6:0] minutes,
    input [6:0] seconds,
    output reg [3:0] anode_signals,
    output reg [6:0] display_out
);


	// Verilog function to divide 2 numbers in a synthesizable way
	// Inspired by https://verilogcodes.blogspot.com/2015/11/synthesisable-verilog-code-for-division.html
		
	//the size of input and output ports of the division module is generic
	parameter WIDTH = 7;
	function [WIDTH-1:0] divide(input [WIDTH-1:0] A, input [WIDTH-1:0] B);
		//internal variables
		reg [WIDTH-1:0] a1,b1;
		reg [WIDTH:0] p1;
		integer i;
			
		begin
			//initialize the variables.
			a1 = A;
			b1 = B;
			p1= 0;
			
			for(i = 0; i < WIDTH; i = i + 1) begin //start the for loop
				p1 = {p1[WIDTH-2:0], a1[WIDTH-1]};
				a1[WIDTH-1:1] = a1[WIDTH-2:0];
				p1 = p1-b1;
				
				if(p1[WIDTH-1] == 1) begin
					a1[0] = 0;
					p1 = p1 + b1;
				end else
					a1[0] = 1;
			end
				
			divide = a1;   
		end
	endfunction
	
	// Verilog function to find the modulus of 2 numbers in a synthesizable way
	// Inspired by https://verilogcodes.blogspot.com/2015/11/synthesisable-verilog-code-for-division.html
		
	//the size of input and output ports of the modulus module is generic
	function [WIDTH-1:0] modulus(input [WIDTH-1:0] A, input [WIDTH-1:0] B);
		//internal variables
		reg [WIDTH-1:0] a1,b1;
		reg [WIDTH:0] p1;
		integer i;
			
		begin
			//initialize the variables.
			a1 = A;
			b1 = B;
			p1= 0; // stores 
			
			for(i = 0; i < WIDTH; i = i + 1) begin //start the for loop
				p1 = {p1[WIDTH-2:0], a1[WIDTH-1]};
				a1[WIDTH-1:1] = a1[WIDTH-2:0];
				p1 = p1-b1;
				
				if(p1[WIDTH-1] == 1) begin
					a1[0] = 0;
					p1 = p1 + b1;
				end else
					a1[0] = 1;
			end
				
			modulus = p1;   
		end
	endfunction


    reg [3:0] LED_BCD; // Binary signal which indicates which cathodes to toggle to enable LEDs on display

	/*
    `ifdef SIM_STOPWATCH
        // 4 bit counter to create faster refresh rate for simulation of full design
        reg [3:0] refresh_counter;

        wire [1:0] LED_activating_counter;

        always @(posedge clock or posedge reset)
        begin 
            if (reset == 1) begin
                refresh_counter <= 0;
                anode_signals <= 0;
                display_out <= 0;
            end else
                refresh_counter <= refresh_counter + 1;
        end
        
        assign LED_activating_counter = refresh_counter[3:2]; 
    `else
        // 17-bit for creating 380Hz refresh rate (I think)
        reg [16:0] refresh_counter; // the first 2 MSB bits for creating 4 LED-activating signals with 2.6ms digit period
        
        wire [1:0] LED_activating_counter;

        // Generate clock signal from 50Mhz board clock for creating the 2.6ms digit period (refresh rate for the display)
        always @(posedge clock or posedge reset)
        begin 
            if (reset == 1) begin
                refresh_counter <= 0;
                anode_signals <= 0;
                display_out <= 0;
            end else
                refresh_counter <= refresh_counter + 1;
        end
        
        assign LED_activating_counter = refresh_counter[16:15];
    `endif
	*/
	
	// 17-bit for creating 380Hz refresh rate (I think)
    reg [16:0] refresh_counter; // the first 2 MSB bits for creating 4 LED-activating signals with 2.6ms digit period
        
    wire [1:0] LED_activating_counter;

    // Generate clock signal from 50Mhz board clock for creating the 2.6ms digit period (refresh rate for the display)
    always @(posedge clock or posedge reset)
	begin 
		if (reset == 1) begin
            refresh_counter <= 0;
        end else
            refresh_counter <= refresh_counter + 1;
    end
        
    assign LED_activating_counter = refresh_counter[16:15];

    // anode activating signals for 4 LEDs, digit period of 2.6ms
    // decoder to generate anode signals 
    always @(posedge clock or posedge reset)
    begin
		if (reset == 1) begin // Note: you can only drive signals inside one process block
			anode_signals <= 0;
		end
		else begin
			case(LED_activating_counter)
				2'b00: 
					begin
						// Display the first digit of the minutes number
						// activate LED1 and Deactivate LED2, LED3, LED4
						anode_signals <= 4'b0111; 
						LED_BCD <= divide(minutes, 10);
					end
				2'b01:
					begin
						// Display the second digit of the minutes number
						// activate LED2 and Deactivate LED1, LED3, LED4
						anode_signals <= 4'b1011;
						LED_BCD <= modulus(minutes, 10);
					end
				2'b10:
					begin
						// Display the first digit of the seconds number
						// activate LED3 and Deactivate LED2, LED1, LED4
						anode_signals <= 4'b1101;
						LED_BCD <= divide(seconds, 10);
					end
				2'b11: 
					begin
						// Display the second digit of the seconds number
						// activate LED4 and Deactivate LED2, LED3, LED1
						anode_signals <= 4'b1110;
						LED_BCD <= modulus(seconds, 10);
					end
			endcase
		end
    end
    
    // Cathode patterns of the 7-segment LED display 
    always @(posedge clock or posedge reset)
    begin
		if (reset == 1) begin // Note: you can only drive signals inside one process block
			display_out <= 0;
		end
		else begin
			case(LED_BCD)
				4'b0000: display_out <= 7'b0000001; // "0"
				4'b0001: display_out <= 7'b1001111; // "1" 
				4'b0010: display_out <= 7'b0010010; // "2" 
				4'b0011: display_out <= 7'b0000110; // "3" 
				4'b0100: display_out <= 7'b1001100; // "4" 
				4'b0101: display_out <= 7'b0100100; // "5" 
				4'b0110: display_out <= 7'b0100000; // "6" 
				4'b0111: display_out <= 7'b0001111; // "7" 
				4'b1000: display_out <= 7'b0000000; // "8"     
				4'b1001: display_out <= 7'b0000100; // "9" 
				default: display_out <= 7'b0000000; // "0"
			endcase
		end
    end

endmodule
