`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   20:28:18 03/14/2018
// Design Name:   synchro
// Module Name:   U:/win/Desktop/lab6/project/synchro_tb.v
// Project Name:  project
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: synchro
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module synchro_tb;

	// Inputs
	reg push;
	reg clk;
	reg rst;

	// Outputs
	wire sypush;

	// Instantiate the Unit Under Test (UUT)
	synchro uut (
		.push(push), 
		.clk(clk), 
		.rst(rst), 
		.sypush(sypush)
	);
	
	//Setting up the clock
	always #20 clk <= ~clk;
	
	initial begin
		// Initialize Inputs
		push = 0;
		clk = 0;
		rst = 0;

		// Wait 100 ns for global reset to finish
		#100;
		
		//Resetting the system
		@(posedge clk) #1;
			rst = 1;
		@(posedge clk) #1;
			rst = 0;
		
		#39 push = 1; //Pushing
		#10 push = 0;
		 
		 #10
		 //Pushing
		@(posedge clk);
		begin
			push = 1;
			#10; push = 0; //Asynchronous push
		 end
		 
		 #10
		 $finish;
	end
      
endmodule

