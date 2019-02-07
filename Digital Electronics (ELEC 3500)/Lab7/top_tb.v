`timescale 1ms / 1ns

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   10:21:36 03/16/2018
// Design Name:   top
// Module Name:   U:/win/Desktop/ELEC3500/Lab7/project/top_tb.v
// Project Name:  project
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: top
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module top_tb;

	// Inputs
	reg clk;
	reg rst;
	reg winrnd;
	
	// Outputs
	wire leds_on;
	wire clear;
	wire [1:0] led_control;

	// Instantiate the Unit Under Test (UUT)
	top uut (
		.winrnd(winrnd),
		.clk(clk), 
		.rst(rst), 
		.leds_on(leds_on), 
		.clear(clear), 
		.led_control(led_control)
	);

	always #1 clk <= ~clk;
    
		initial begin
				// Initialize Inputs
				//slowen = 0;
				winrnd = 0;
				rst = 0;
				clk = 0;

				//Reset system
				@(posedge clk) #1; 
				rst = 1;
				@(posedge clk) #1;
				rst = 0;
				
				//Case 1: Reset -> Wait_a
				wait(leds_on == 1 & clear == 1 & led_control == 2'b11);
				
				//Case 2: Wait_a -> Wait_b
				wait(leds_on == 1 & clear == 1 & led_control == 2'b11);
				
				//Case 3: Wait_b -> Dark
				wait(leds_on == 0 & clear == 0 & led_control == 2'b00);
				
				//Case 4: Dark -> Gloat_a
				winrnd = 1;
				wait(leds_on == 1 & clear == 1 & led_control == 2'b10);
				winrnd = 0;
				
				//Case 5: Gloat_a -> Gloat_b
				wait(leds_on == 1 & clear == 1 & led_control == 2'b10);
				
				//Case 6: Gloat_b -> Dark
				wait(leds_on == 0 & clear == 0 & led_control == 2'b00);
				
				//Case 7: Dark -> Play
				wait(leds_on == 1 & clear == 0 & led_control == 2'b10)
				
				//Case 8: Play -> Gloat_a
				winrnd = 1;
				wait(leds_on == 1 & clear == 1 & led_control == 2'b10);
				winrnd = 0;
				
				//Case 9: Gloat_a -> Gloat_b
				wait(leds_on == 1 & clear == 1 & led_control == 2'b10);
				
				#2000
				$finish;
			
			end
      
endmodule

