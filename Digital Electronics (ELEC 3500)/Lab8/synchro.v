`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    08:37:26 03/09/2018 
// Design Name: 
// Module Name:    synchro 
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


//Meant to delay the push signal till after the clock edge if push changes at the setup and hold time range of a posedge clk
//If it fails to capture it, it simply delays the push to the next clock edge
//If it captures it, it will send the synchronized push to the scorer after the clock edge
module synchro(push, clk, rst, sypush);

	input push, clk, rst;
	output sypush;
	reg sypush;
	
	always@(posedge clk or posedge rst) //asynchronous reset
		begin
		if(rst) sypush <= 0;
		else sypush <= push;
		end
endmodule
