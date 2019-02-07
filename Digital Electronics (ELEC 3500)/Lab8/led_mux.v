`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    08:42:16 03/23/2018 
// Design Name: 
// Module Name:    led_mux 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module led_mux(score, led_control, led_out);
	input [6:0] score;
	input [1:0] led_control;
	output [6:0] led_out;
	reg [6:0] led_out;
	
	`define score_display	2
	`define all_on				3
	`define all_off			0
	`define reset  			1
	
	always @(led_control)
		begin
		case(led_control)
			`score_display: led_out = score; 
			`all_on: led_out = 7'b1111111;
			`all_off: led_out = 7'b0000000;
			`reset: led_out = 7'b1111011;
		endcase
	end
endmodule
