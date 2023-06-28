// Testbench to test division code
// NOTE: Only tests the function
module tb_divison;

	// Verilog function to divide 2 numbers in a synthesizable way
	// Inspired by https://verilogcodes.blogspot.com/2015/11/synthesisable-verilog-code-for-division.html
		
	//the size of input and output ports of the division module is generic.
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

	reg [WIDTH-1:0] param_A, param_B, result;
	integer i = 0;
	reg test_OK;

	initial begin
		param_A = 0;
		param_B = 10;
		test_OK = 1'b1;
		
		#10;

		// Divide every number between 0-99 by 10 and check the result
		for (i = 0; i < 100; i = i + 1) begin
			#5;
			param_A = i;
			result = divide(param_A, param_B);
			
			if (result != (param_A / param_B)) begin
				test_OK = 1'bx; // Result was incorrect, set to unkown value ('X') to indicate
			end else
				test_OK = 1;
		end
		
		test_OK = 1'bx;
		
		#10;
	end

endmodule