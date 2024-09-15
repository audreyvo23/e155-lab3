// Audrey Vo
// avo@hmc.edu
// 9/12/2024
// This code is a testbench for the synchronizer of keypad inputs.

`timescale 1ns/1ns

module synchronizer_tb ();
logic clk, reset;
logic async_C0, async_C1, async_C2, async_C3;
logic C0, C1, C2, C3;


 // Instantiate the device under test
 synchronizer dut(.clk(clk), .reset(reset), .async_C0(async_C0), .async_C1(async_C1), .async_C2(async_C2), .async_C3(async_C3), .C0(C0), .C1(C1), .C2(C2), .C3(C3));

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

	async_C0 = 0;
	async_C1 = 0;
	async_C2 = 0;
	async_C3 = 0;

	#50;

	async_C0 = 1;
	async_C1 = 0;
	async_C2 = 0;
	async_C3 = 0;

	#50;

	async_C0 = 0;
	async_C1 = 0;
	async_C2 = 0;
	async_C3 = 0;
	

   end
  // Apply test vector on the rising edge of clk
endmodule