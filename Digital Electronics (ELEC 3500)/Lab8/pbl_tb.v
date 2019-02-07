`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   11:37:53 03/09/2018
// Design Name:   pbl
// Module Name:   U:/win/Desktop/ELEC3500/Lab6/Lab6/pbl_tb.v
// Project Name:  Lab6
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: pbl
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module pbl_tb;

	// Inputs
	reg pbr;
	reg pbl;
	reg clear;
	reg rst;

	// Outputs
	//The outputs will stay up once put up due to the nature of the latch holding the value
	//The outputs will only go down once the latch is reset or cleared
	wire push;
	wire tie;
	wire right;

	// Instantiate the Unit Under Test (UUT)
	
	pbl uut (
		.pbl(pbl),
		.pbr(pbr),
		.clear(clear),
		.rst(rst),
		.push(push),
		.tie(tie),
		.right
	);

	initial begin
		//Initializing Inputs
		pbr = 0;
		pbl = 0;
		clear = 0;
		rst = 0;

		#10 rst = 1;	//put system in reset
		#10; rst = 0; //take out of reset
		
		//Left pushed first
		#10; pbl = 1;
		#1; pbr = 1;
		#1; pbl = 0; pbr = 0;
		
		
		//Clearing system
		#10 clear = 1;
		#10; clear = 0;
		
		//Right pushed first
		#10; pbr = 1;
		#1; pbl = 1;
		#1; pbl = 0; pbr = 0;
		
		//Resetting system
		#10 rst = 1;
		#10; rst = 0;
	
		//Both push at the same time
		#10; pbr = 1; pbl = 1;
		#1; pbl = 0; pbr = 0;
		
		//Resetting system
		#10 rst = 1;
		#10; rst = 0;
		
		$finish;

	end
      
endmodule

