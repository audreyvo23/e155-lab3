// Audrey Vo
// avo@hmc.edu
// 9/3/2024
// This code controls the 3 Leds on the development board and also calls the 7-segement display. In addition, code for the test benches of this file was added.

`timescale 1ns/1ns


module muxtb();
 // Set up test signals
 logic clk, reset;
 logic [3:0] s_expected;
 logic [3:0] s1;
 logic [3:0] s2;
 logic selector;
 logic [3:0] s;




 // Instantiate the device under test
 mux dut(.s1(s1), .s2(s2), .selector(selector), .s(s));

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
	 s1 = 4'b1000;
         s2 = 4'b0000;
	 selector = 1;
	 s_expected = 4'b0000;
	
     	#20;

	selector = 0;
	s_expected = 4'b1000;

	
	#20;

	selector = 1;
	s_expected = 4'b0000;

   end
  // Apply test vector on the rising edge of clk
 
endmodule
