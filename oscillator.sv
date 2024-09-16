// Audrey Vo
// avo@hmc.edu
// 9/12/2024
// This code controls the the clock speed of the system.
module oscillator (input logic clk,
	input logic [3:0] s,
	output logic [2:0] led);
	logic pulse;
	logic led_state = 1;
	logic [24:0] counter = 0;
	
	
	
	
	// Simple clock divider
	always_ff @(posedge clk)
		begin
			// checks if counter has hit 10M (to get 2.4 Hz signal)
			if(counter != 10000) counter <= counter + 1;
			else if (counter == 10000 & led_state == 0) 
				begin 
					led_state <= 1;
					counter <= 0;
				end
			else if (counter == 10000 & led_state == 1) 
				begin 
					led_state <= 0;
					counter <= 0;
				end
		end
	

endmodule
