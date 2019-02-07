`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   08:45:24 03/16/2018
// Design Name:   div256
// Module Name:   U:/win/Desktop/ELEC3500/Lab7/project/div256_tb.v
// Project Name:  project
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: div256
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module div256_tb;

	// Inputs
	reg clk;
	reg rst;

	// Outputs
	wire slowen;

	// Instantiate the Unit Under Test (UUT)
	div256 uut (
		.clk(clk), 
		.rst(rst), 
		.slowen(slowen)
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
		
      wait(slowen == 1);
		#1000;
		$finish;

	end
      
endmodule

