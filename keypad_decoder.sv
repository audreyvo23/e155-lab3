// Audrey Vo
// avo@hmc.edu
// 9/13/2024
// This code controls the the 7-segement display based on the input of the switcbes for a common cathode.

module keypad_decoder (
	input logic [7:0] keypad_val,
	output logic [3:0] s
);

	always_comb 
	begin
		case(keypad_val)
			// checks the s input and assigns output to display appropriate values
			7'b10000100: 	s = 4'h0;
			7'b00011000:	s = 4'h1;
			7'b00010100: 	s = 4'h2;
			7'b00010010: 	s = 4'h3;
			7'b00101000:	s = 4'h4;
			7'b00100100: 	s = 4'h5;
			7'b00100010: 	s = 4'h6;
			7'b01001000:	s = 4'h7;
			7'b01000100: 	s = 4'h8;
			7'b01000010: 	s = 4'h9;
			7'b10001000:	s = 4'ha;
			7'b10000010: 	s = 4'hb;
			7'b00010001: 	s = 4'hc;
			7'b00100001: 	s = 4'hd;
			7'b01000001:	s = 4'he;
			7'b10000001: 	s = 4'hf;
			default s = 4'h0;
		endcase
	end
	
	



endmodule
