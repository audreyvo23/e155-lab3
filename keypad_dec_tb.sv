// Audrey Vo
// avo@hmc.edu
// 9/14/2024
// This is a testbench for the oscillator module.
`timescale 1ns/1ns


module keypad_dec_tb();
 // Set up test signals
logic [7:0] keypad_val;
logic [3:0] expected_s;
logic [3:0] s;
logic clk, reset;



 // Instantiate the device under test
 keypad_decoder dut(.keypad_val(keypad_val), .s(s));

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

	keypad_val = 8'b00000000;
	expected_s = 4'h0;


	#20;

	keypad_val = 8'b10000001;
	expected_s = 4'hf;

	#20;

	keypad_val = 8'b10000010;
	expected_s = 4'hb;

	

   end
  // Apply test vector on the rising edge of clk
 
endmodule
