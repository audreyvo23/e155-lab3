// Audrey Vo
// avo@hmc.edu
// 9/14/2024
// This is a testbench for the oscillator module.
`timescale 1ns/1ns


module debounce_tb();
 // Set up test signals
logic clk, reset;
logic [7:0] keypad_val;
logic button_on;
logic [7:0] no_bounce_keypad;



 // Instantiate the device under test
 debounce dut(.clk(clk), .keypad_val(keypad_val), .button_on(button_on), .no_bounce_keypad(no_bounce_keypad));

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

	button_on = 0;
	keypad_val = 7'b10000000;
	#20;

	button_on = 1;
	keypad_val = 7'b10000010;
	#40;

	button_on = 0;
	keypad_val = 7'b10000000;
	#80;

	button_on = 1;
	keypad_val = 7'b10000010;
	#500;
	

   end
  // Apply test vector on the rising edge of clk
 
endmodule
