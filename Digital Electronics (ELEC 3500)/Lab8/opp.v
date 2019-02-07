`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    08:37:00 03/09/2018 
// Design Name: 
// Module Name:    opp 
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

module opp(sypush, clk, rst, winrnd);
	input sypush, clk, rst;
	output winrnd;
	reg sypush_prev;
	
	always@(posedge clk or posedge rst)
		if(rst) sypush_prev <= 0;
		else sypush_prev <= sypush;
		
	assign winrnd = ~sypush_prev&sypush;
endmodule
