`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   08:55:38 03/23/2018
// Design Name:   led_mux
// Module Name:   U:/win/Desktop/ELEC3500/Lab8-2/led_mux_tb.v
// Project Name:  Lab8-2
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: led_mux
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module led_mux_tb;

	// Inputs
	reg [6:0] score;
	reg [1:0] led_control;
	
	//Output
	wire [6:0] leds_out;
	
	// Instantiate the Unit Under Test (UUT)
	led_mux uut (
		.score(score), 
		.led_control(led_control),
		.leds_out(leds_out)
	);

	initial begin
		// Initialize Inputs
		score = 7'b0100000;
		
		//case 1
		led_control = 2'b11;
		
		//case 2
		#10;
		led_control = 2'b10;
		
		//case 3
		#10;
		led_control = 2'b01;
		
		//case 4
		#10;
		led_control = 2'b00;
		
		#10;
		$finish;
	end
      
endmodule

