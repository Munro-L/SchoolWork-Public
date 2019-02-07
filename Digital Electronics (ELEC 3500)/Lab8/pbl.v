`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    08:36:34 03/09/2018 
// Design Name: 
// Module Name:    pbl 
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

module pbl(pbl, pbr, clear, rst, push, tie, right);

	input pbl, pbr, clear, rst;
	output push, tie, right;
	
	wire BLX, BRX, L, R; //input and output of the RS latch
	assign BLX = pbl&~R;
	assign BRX = pbr&~L;
	
	RSLatch Llatch(BLX, clear, rst, L);
	RSLatch Rlatch(BRX, clear, rst, R);
	
	assign push = L|R; //either player pushed
	assign tie = L&R; //both players pushed
	assign right = R&~L; //right player pushed

endmodule

module RSLatch(in, clear, rst, out);

	input in, clear, rst;
	output out;
	
	wire inx;
	assign inx = in|out;
	assign out = inx&~(rst|clear);
	
endmodule
