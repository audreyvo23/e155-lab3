// Audrey Vo
// avo@hmc.edu
// 9/14/2024
// This is a testbench for the top lab3 module.
`timescale 1ns/1ns


module top_tb();
logic clk, reset;
logic async_C0, async_C1, async_C2, async_C3;
logic [7:0] sevenSeg;
logic [7:0] expected_sevenSeg;



 // Instantiate the device under test
 lab3 dut(.reset(reset), .async_C0(async_C0), .async_C1(async_C1), .async_C2(async_C2), .async_C3(async_C3), .sevenSeg(sevenSeg));

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

    expected_sevenSeg = 7'b1000000;

	#20;

	async_C0 = 1;
    async_C1 = 0;
    async_C2 = 0;
    async_C3 = 0;
    
    // will output A
    expected_sevenSeg = 7'b0001000;

	#20;

	async_C0 = 0;
    async_C1 = 1;
    async_C2 = 0;
    async_C3 = 0;

    // will output 8
    expected_sevenSeg = 7'b0000000;


	

   end
  // Apply test vector on the rising edge of clk
 
endmodule

