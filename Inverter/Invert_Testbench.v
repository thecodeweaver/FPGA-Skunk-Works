module testbench;
  reg signal;
  wire out;
  
  invert dut(.signal(signal), .out(out));
  
  initial begin
    signal = 1'b1;
    $monitor("out = %b", out);
  end
endmodule
