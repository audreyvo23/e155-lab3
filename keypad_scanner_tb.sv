// Audrey Vo
// avo@hmc.edu
// 9/14/2024
// This is a testbench for the oscillator module.
`timescale 1ns/1ns


module keypad_tb();
 // Set up test signals
logic clk, reset, C0, C1, C2, C3;
logic [7:0] keypad_val;
logic expected_button_on;
logic [7:0] expected_keyval;



 // Instantiate the device under test
 keypad_scanner dut(.clk(clk), .reset(reset), .
C0(C0), .C1(C1), .C2(C2), .C3(C3), .keypad_val(keypad_val));

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

	C0 = 0;
	C1 = 0;
	C2 = 0;
	C3 = 0;
	expected_button_on = C0 | C1 | C2 | C3;


	#20;

	C0 = 0;
	C1 = 1;
	C2 = 0;
	C3 = 0;
	expected_button_on = C0 | C1 | C2 | C3;

	#20;

	C0 = 0;
	C1 = 0;
	C2 = 0;
	C3 = 0;
	expected_button_on = C0 | C1 | C2 | C3;
	

   end
  // Apply test vector on the rising edge of clk
 
endmodule
