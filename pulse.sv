// Audrey Vo
// avo@hmc.edu
// 9/9/2024
// This code creates an enabled that will be inputted into the shifter/memory module.
// This code was taken from the Lecture 4 handout notes.
module pulse(input logic clk, reset,
		input logic button_on, 
		output logic pulse);


	logic [2:0] state, nextstate;

	parameter S0 = 3'b001;
	parameter S1 = 3'b010;
	parameter S2 = 3'b100;
	
	//state register
	always_ff @(posedge clk, posedge reset)
		if (reset) state <= S0;
		else 	state <= nextstate;
	
	// next state logic
	always_comb
		case (state)
			S0: if(button_on) nextstate = S1;
				else nextstate = S0;
			S1: if(button_on) nextstate = S2;
				else nextstate = S0;
			S2: if(button_on) nextstate = S2;
				else nextstate = S0;
			default: nextstate = S0;
		endcase


	assign pulse = (state == S1);
		
endmodule
