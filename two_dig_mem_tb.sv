// Audrey Vo
// avo@hmc.edu
// 9/12/2024
// This code is a testbench for storing the last two key digits from the keypad inputs.

`timescale 1ns/1ns

module two_digit_mem_tb ();
logic clk, reset;
logic [3:0] s;
logic [3:0] s1, s2;
logic pulse;


 // Instantiate the device under test
 two_digit_mem dut(.clk(clk), .reset(reset), .s(s), .pulse(pulse), .s1(s1), .s2(s2));

 // Generate clock signal with a period of 10 timesteps.
 always
   begin
     clk = 1; #5;
     clk = 0; #5;
   end
  
 // At the start of the simulation:
 //  - Load the testvectors
 //  - Pulse the reset line (if applicable)
 initial
   begin
	reset = 0;
	#10;
	reset = 1;
	#10;
	reset = 0;

	s = 4'b0001;
	pulse = 1;

	#10;

	s = 4'b0010;
	pulse = 0;

	#10;

	s = 4'b0011;
	pulse = 0;
    
    #10;
    
    s = 4'b0100;
	pulse = 1;

	#10;

	s = 4'b0101;
	

   end
  // Apply test vector on the rising edge of clk
endmodule
