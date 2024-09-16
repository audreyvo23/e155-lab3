// Audrey Vo
// avo@hmc.edu
// 9/12/2024
// This code controls the the 7-segment display based on the input of the switcbes for a common cathode.
module lab3 (input logic clk, reset,
		input logic async_C0, async_C1, async_C2, async_C3,
		output logic [6:0] sevenSeg
		);
	logic [7:0] keypad_val;
	logic int_osc;
	logic grid;
	logic [3:0] s, s1, s2;
	logic button_on;
	logic [7:0] no_bounce_keypad;
	logic C0, C1, C2, C3;
	logic selector1, selector2;
	logic pulse;
	logic [3:0] mux_s;

	// Internal high-speed oscillator
	//HSOSC hf_osc (.CLKHFPU(1'b1), .CLKHFEN(1'b1), .CLKHF(int_osc));

	// synchronizes the keypad inputs
	synchronizer s3 (clk, reset, async_C0, async_C1, async_C2, async_C3, C0, C1, C2, C3);
	
	// FSM that scans the keypad
	keypad_scanner s0 (clk, reset, C0, C1, C2, C3, keypad_val, button_on);

	// outputs a pulse to enable the shifter
	pulse s12 (clk, reset, button_on, pulse);
	
	// takes care of debouncing when button is clicked
	debounce s5 (clk, keypad_val, button_on, no_bounce_keypad);

	// decodes the switch value from the rows and columns turned on
	keypad_decoder s6 (no_bounce_keypad, s);

	// stores the memory of the digits
	two_digit_mem s4 (clk, reset, s, s1, s2);

	// internal oscillator that outputs 2 selectors
	selector_checker s7 (clk, selector1, selector2);
	
	// mux module called that outputs the desired segment input
	mux s8 (s1, s2, selector1, mux_s);

	// seven Segment code from Lab 1
	sevenSeg s9 (mux_s, sevenSeg);

	

	

endmodule
