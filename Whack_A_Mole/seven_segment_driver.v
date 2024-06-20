// Seven segment driver
// 6/19/2024
module seven_segment_driver(
    input clk,
    input reset,
    input [9:0] score, // Score to be displayed, max score is 1,024

    output [3:0] seven_segment_anodes,
    output [7:0] seven_segment_cathodes
);

endmodule