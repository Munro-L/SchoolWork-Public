`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   10:10:08 03/23/2018
// Design Name:   tow
// Module Name:   U:/win/Desktop/ELEC3500/Lab8-2/tow_tb.v
// Project Name:  Lab8-2
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: tow
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module tow_tb;

	// Inputs
	reg pbr;
	reg pbl;
	reg clk;
	reg rst;

	// Outputs
	wire [6:0] leds_out;

	// Instantiate the Unit Under Test (UUT)
	tow uut (
		.pbr(pbr), 
		.pbl(pbl), 
		.clk(clk), 
		.rst(rst), 
		.leds_out(leds_out)
	);

	always #976567 clk <= ~clk;

	initial begin
		// Initialize Inputs
		pbr = 0;
		pbl = 0;
		clk = 0;
		rst = 0;

		// Wait 100 ms for global reset to finish
      
		@(posedge clk) #100000;
			rst = 1;
		@(posedge clk);
			rst = 0;
		
		wait(leds_out == 7'b0001000); //N
		
		//Right clicks button first
		@(posedge clk);
			#100000000 pbr = 1;
			#100000000 pbl = 1;
		@(posedge clk);
			#100000000 pbr = 0; pbl = 0;
			
		wait(leds_out == 7'b0000100); //Updated score to R1
		wait(leds_out == 7'b0000000);	//Dark State
		wait(leds_out == 7'b0000100); //Light comes up again
		
		//Right clicks button firzt
		@(posedge clk);
			#100000000 pbr = 1;
			#100000000 pbl = 1;
		@(posedge clk);
			#100000000 pbr = 0; pbl = 0;

		wait(leds_out == 7'b0000010); //Updating score to R2
		wait(leds_out == 7'b0000000);	//Dark State
		wait(leds_out == 7'b0000010); //Light comes up again
		
		//Right clicks button first
		@(posedge clk);	
			#100000000 pbr = 1;
			#100000000 pbl = 1;
		@(posedge clk);
			#100000000 pbr = 0; pbl = 0;
			
		wait(leds_out == 7'b0000001); //Updated score to R3
		wait(leds_out == 7'b0000000); //Dark State
		
		//R jumps the light before R3 led comes on
		@(posedge clk);
			#100000000 pbr = 1;
		@(posedge clk);
			#100000000 pbr = 0;
		
		//Test #1 - Right jumping the light from R3
		wait(leds_out == 7'b0000010); //Updated score to R2
		if(leds_out == 7'b0000010) $display("%t - Test #1 - Right jumping the light from R3 [SUCCESS. Score was %b]", $time, leds_out);
		else $display("%t - FAILURE. Score was %b", $time, leds_out);
		
		wait(leds_out == 7'b0000000); //Dark State	
		wait(leds_out == 7'b0000010); //Light comes up again
		
		//Right button pushes first
		@(posedge clk);
			#100000000 pbr = 1;
			#100000000 pbl = 1;
		@(posedge clk);
			#100000000 pbr = 0; pbl = 0;
		
		wait(leds_out == 7'b0000001); //Updated score to R3
		wait(leds_out == 7'b0000000); //Dark state
		wait(leds_out == 7'b0000001); //Light comes up again
		
		//Left button pushes first
		@(posedge clk);
			#100000000 pbl = 1;
			#100000000 pbr = 1;
		@(posedge clk);
			#100000000 pbl = 0; pbr = 0;
		
		//Test #2 - Left pushes first from R3
		wait(leds_out == 7'b0000100); //Updating score to R1
		if(leds_out == 7'b0000100) $display("%t - Test #2 - Left pushes first from R3 [SUCCESS. Score was %b]", $time, leds_out);
		else $display("%t - FAILURE. Score was %b", $time, leds_out);
		
		wait(leds_out == 7'b0000000); //Dark State
		wait(leds_out == 7'b0000100); //Light comes up again
		
		//Right button pushes first
		@(posedge clk);
			#100000000 pbr = 1;
			#100000000 pbl = 1;
		@(posedge clk);
			#100000000 pbr = 0; pbl = 0;
		
		wait(leds_out == 7'b0000010); //Updating score to R2
		wait(leds_out == 7'b0000000); //Dark State
		wait(leds_out == 7'b0000010); //Light comes up again
		
		//Right button pushes first
		@(posedge clk);
			#100000000 pbr = 1;
			#100000000 pbl = 1;
		@(posedge clk);
			#100000000 pbr = 0; pbl = 0;
		
		wait(leds_out == 7'b0000001); //Updating score to R3
		wait(leds_out == 7'b0000000); //Dark State
		wait(leds_out == 7'b0000001); //Light comes up again
		
		//Test #3 - Right pushes first from R3
		@(posedge clk);
			#100000000 pbr = 1;
			#100000000 pbl = 1;
		@(posedge clk);
			#100000000 pbr = 0; pbl = 0;
		
		//Test #3 - Right pushes first from R3
		wait(leds_out == 7'b0000111); //Updating score to WR
		if(leds_out == 7'b0000111) $display("%t - Test #3 - Right pushes first from R3 [SUCCESS. Score was %b]", $time, leds_out);
		else $display("%t - FAILURE. Score was %b", $time, leds_out);
		
		//25s at this point
		#1000000000;
		
		//Resetting Game
		@(posedge clk) #10000000;
			rst = 1;
		@(posedge clk) #100000000;
			rst = 0;
			
		wait(leds_out == 7'b0001000); //N
		
		//Left button pushes first
		@(posedge clk);
			#100000000 pbl = 1;
			#100000000 pbr = 1;
		@(posedge clk);
			#100000000 pbl = 0; pbr = 0;
			
		wait(leds_out == 7'b0010000); //Updated score to L1
		wait(leds_out == 7'b0000000);	//Dark State
		wait(leds_out == 7'b0010000); //Light comes up again
		
		//Left button pushes first
		@(posedge clk);
			#100000000 pbl = 1;
			#100000000 pbr = 1;
		@(posedge clk);
			#100000000 pbl = 0; pbr = 0;
			
		wait(leds_out == 7'b0100000); //Updated score to L2
		wait(leds_out == 7'b0000000);	//Dark State
		wait(leds_out == 7'b0100000); //Light comes up again
		
		//Left button pushes first
		@(posedge clk);
			#100000000 pbl = 1;
			#100000000 pbr = 1;
		@(posedge clk);
			#100000000 pbl = 0; pbr = 0;
			
		wait(leds_out == 7'b1000000); //Updated score to L3
		wait(leds_out == 7'b0000000);	//Dark State

		//Left button pushes first
		@(posedge clk);
			#100000000 pbl = 1;
		@(posedge clk);
			#100000000 pbl = 0;

		//Test #4 - Left jumping the light from L3
		wait(leds_out == 7'b0100000); //Updated score to L2
		if(leds_out == 7'b0100000) $display("%t - Test #4 - Left jumping the light from L3 [SUCCESS. Score was %b]", $time, leds_out);
		else $display("%t - FAILURE. Score was %b", $time, leds_out);
		
		wait(leds_out == 7'b0000000);	//Dark State
		wait(leds_out == 7'b0100000); //Light comes up again
		
		//Left button pushes first
		@(posedge clk);
			#100000000 pbl = 1;
			#100000000 pbr = 1;
		@(posedge clk);
			#100000000 pbl = 0; pbr = 0;
			
		wait(leds_out == 7'b1000000); //Updated score to L3
		wait(leds_out == 7'b0000000);	//Dark State
		wait(leds_out == 7'b1000000); //Light comes on again
	
		//Right button pushes first
		@(posedge clk);
			#100000000 pbr = 1;
			#100000000 pbl = 1;
		@(posedge clk);
			#100000000 pbr = 0; pbl = 0;
	
		//Test #5 - Right pushes first from L3
		wait(leds_out == 7'b0010000); //Updating score to L1
		if(leds_out == 7'b0010000) $display("%t - Test #5 - Right pushes first from L3 [SUCCESS. Score was %b]", $time, leds_out);
		else $display("%t - FAILURE. Score was %b", $time, leds_out);
		
		wait(leds_out == 7'b0000000);	//Dark State
		wait(leds_out == 7'b0010000); //Light comes on again
				
		//Left button pushes first
		@(posedge clk);
			#100000000 pbl = 1;
			#100000000 pbr = 1;
		@(posedge clk);
			#100000000 pbl = 0; pbr = 0;
			
		wait(leds_out == 7'b0100000); //Updated score to L2
		wait(leds_out == 7'b0000000);	//Dark State
		wait(leds_out == 7'b0100000); //Light comes up again
		
		//Left button pushes first
		@(posedge clk);
			#100000000 pbl = 1;
			#100000000 pbr = 1;
		@(posedge clk);
			#100000000 pbl = 0; pbr = 0;
			
		wait(leds_out == 7'b1000000); //Updated score to L3
		wait(leds_out == 7'b0000000);	//Dark State
		wait(leds_out == 7'b1000000); //Light comes up again
		
		//Test #6 - Left pushes first from L3
		@(posedge clk);
			#100000000 pbl = 1;
			#100000000 pbr = 1;
		@(posedge clk);
			#100000000 pbl = 0; pbr = 0;
		
		//Test #6 - Left pushes first from L3
		wait(leds_out == 7'b1110000); //Updating score to WL
		if(leds_out == 7'b1110000) $display("%t - Test #6 - Left pushes first from L3 [SUCCESS. Score was %b]", $time, leds_out);
		else $display("%t - FAILURE. Score was %b", $time, leds_out);
		
		#1000000000;
		
		//Resetting Game
		@(posedge clk) #10000000;
			rst = 1;
		@(posedge clk);
			#100000000;
			rst = 0;
	
		//Test bench done in 41s
		
	
	end
      
endmodule

