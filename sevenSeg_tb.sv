// Audrey Vo
// avo@hmc.edu
// 9/3/2024
// This code controls the 3 Leds on the development board and also calls the 7-segement display. In addition, code for the test benches of this file was added.

`timescale 1ns/1ns


module sevenSegtb();
 // Set up test signals
logic clk;
logic [3:0] s;
logic [6:0] seg;
logic [6:0] seg_expected;




 // Instantiate the device under test
 sevenSeg dut(.s(s), .seg(seg));

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
	s = 4'b1000;
	seg_expected = 7'b0000000;
	
     	#20;

	s = 4'b0000;
	seg_expected = 7'b1000000;

	#20;

	s = 4'b0000;
	seg_expected = 7'b1000000;

        #20;

	s = 4'b1111;
	seg_expected = 7'b0001110;

	#20
	s = 4'b0011;
	seg_expected = 7'b0110000;


   end
  // Apply test vector on the rising edge of clk
 
endmodule
