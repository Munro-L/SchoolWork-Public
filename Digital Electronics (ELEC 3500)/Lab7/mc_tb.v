`timescale 1ms / 1ns

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   09:05:00 03/16/2018
// Design Name:   mc
// Module Name:   U:/win/Desktop/ELEC3500/Lab7/project/mc_tb.v
// Project Name:  project
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: mc
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module mc_tb;

	// Inputs
	//reg slowen;
	reg rand;
	reg winrnd;
	reg rst;
	reg clk;

	// Outputs
	wire leds_on;
	wire clear;
	wire [1:0] led_control;

	//Create slowen using the div256 module
	//Send slowen to the mc module

	div256 slow (.clk(clk), .rst(rst), .slowen(slowen));
		
	// Instantiate the Unit Under Test (UUT)
	mc uut (
		.slowen(slowen), 
		.rand(rand), 
		.winrnd(winrnd), 
		.rst(rst), 
		.clk(clk), 
		.leds_on(leds_on), 
		.clear(clear), 
		.led_control(led_control)
	);
	

	always #1 clk <= ~clk;
	
			//Slowen was broken :(
			//------------------------------------------------
			//On the 256th clock cycle, this circuit will output a single slowen signal (1 clock cycle long)
			//Need an 8-bit counter to count up to 255
/*			reg [7:0] count;
			wire slowen;

			always @(posedge clk or posedge rst)
			begin
				if(rst) count<= 0;
				else count <= count + 1;
			end

			//Using reduction AND to obtain pulse only at 8'b11111111
			assign slowen = &count;*/
			//------------------------------------------------
		
			initial begin
				// Initialize Inputs
				//slowen = 0;
				rand = 0;
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
				rand = 1;
				wait(leds_on == 1 & clear == 0 & led_control == 2'b10)
				rand = 0;
				
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

