// Audrey Vo
// avo@hmc.edu
// 9/12/2024
// This code controls the the 7-segment display based on the input of the switcbes for a common cathode.
module lab3 (	input logic reset,
		input logic C0, C1, C2, C3,
		output logic [7:0] sevenSeg
		);
	logic [7:0] keypad_val;
	logic int_osc;
	logic grid;
	logic s;
	logic button_on;
	logic [7:0] no_bounce_keypad;

	// Internal high-speed oscillator
	HSOSC hf_osc (.CLKHFPU(1'b1), .CLKHFEN(1'b1), .CLKHF(int_osc));
	
	keypad_scanner s0 (int_osc, reset, C0, C1, C2, C3, keypad_val, button_on);
	
	debounce s1 (int_osc, keypad_val, button_on, no_bounce_keypad);

	keypad_decoder s2 (keypad_val, s);

	

	

endmodule
