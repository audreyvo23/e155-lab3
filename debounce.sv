module debounce(input logic clk,
	input logic [7:0] keypad_val,
	input logic button_on,
	output logic [7:0] no_bounce_keypad);

	logic [24:0] counter = 0;
	
	
	// Simple clock divider
	always_ff @(posedge clk)
		if(button_on) begin
			if(counter > 50) begin counter <= counter;
			assign no_bounce_keypad = keypad_val;
			end
			else begin counter <= counter + 1;
			assign no_bounce_keypad = 8'b00000000;
			end
		end 
		else counter <= 0;
	

endmodule
