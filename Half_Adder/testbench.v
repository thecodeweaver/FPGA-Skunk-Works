// Code your testbench here
// or browse Examples
// Code your testbench here
// or browse Examples
module testbench;
  reg a, b, sum, carry;
  
  half_adder dut (.a(a), .b(b), .sum(sum), .carry(carry));
  
  initial
    begin
      a = 0;
      b = 0;
      #10
      if (sum != 0 && carry != 0) begin
        $display("a = 0, b = 0 failed. sum = %b, carry = %b", sum, carry);
      end
      
      a = 0;
      b = 1;
      #10
      if (sum != 1 && carry != 0) begin
        $display("a = 0, b = 1 failed. sum = %b, carry = %b", sum, carry);
      end
      
      a = 1;
      b = 0;
      #10
      if (sum != 1 && carry != 0) begin
        $display("a = 0, b = 1 failed. sum = %b, carry = %b", sum, carry);
      end
      
      a = 1;
      b = 1;
      #10
      if (sum != 0 && carry != 1) begin
        $display("a = 1, b = 1 failed. sum = %b, carry = %b", sum, carry);
      end
    end
endmodule