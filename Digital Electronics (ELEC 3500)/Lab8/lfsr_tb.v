`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   08:58:04 03/16/2018
// Design Name:   random
// Module Name:   U:/win/Desktop/ELEC3500/Lab7/project/random_tb.v
// Project Name:  project
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: random
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module lfsr_tb;

	// Inputs
	reg clk;
	reg rst;

	// Outputs
	wire rand;

	// Instantiate the Unit Under Test (UUT)
	lfsr uut (
		.clk(clk), 
		.rst(rst), 
		.rand(rand)
	);

	always #1 clk <= ~clk;

		initial begin
			// Initialize Inputs
			clk = 0;
			rst = 0;

			//Reset system
			@(posedge clk) #1; 
			rst = 1;
			@(posedge clk) #1;
			rst = 0;
			
			#1000;
			$finish;

	end
      
endmodule

