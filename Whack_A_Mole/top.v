// Top level module for Whack A Mole game
// 6/19/2024
module top(
    input clk,
    input reset,
    input reg [7:0] switches,

    output reg [7:0] leds,
    output [3:0] seven_segment_anodes,
    output [7:0] seven_segment_cathodes
);

    // Keep track of the score
    reg [9:0] score;
    always @ (posedge clk)
    begin
        if (reset)
            score <= 0;

        if (switches == leds)
            score <= score + 1;
    end

    

endmodule