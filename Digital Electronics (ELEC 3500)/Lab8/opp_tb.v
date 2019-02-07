`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   21:01:51 03/14/2018
// Design Name:   opp
// Module Name:   U:/win/Desktop/lab6/project/opp_tb.v
// Project Name:  project
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: opp
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module opp_tb;

	// Inputs
	reg sypush;
	reg clk;
	reg rst;

	always #20 clk <= ~clk;

	// Outputs
	wire winrnd;

	// Instantiate the Unit Under Test (UUT)
	opp uut (
		.sypush(sypush), 
		.clk(clk), 
		.rst(rst), 
		.winrnd(winrnd)
	);
	
	initial begin
		// Initialize Inputs
		sypush = 0;
		clk = 0;
		rst = 0;

		// Wait 100 ns for global reset to finish
		#100;
   
		//Resetting system
		@(posedge clk) #1;
		rst = 1;
		@(posedge clk) #1;
		rst = 0;
	
		//Testing winrnd for when sypush lasts more than one clock cycle
		#10 sypush = 1;
		#80 sypush = 0;
		
		//Testing winrnd for when sypush lasts less than one clock cylce
		#90 sypush = 1;
		#40 sypush = 0;
		#100;
		$finish;

	end
      
endmodule

