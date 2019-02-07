`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:14:15 03/16/2018 
// Design Name: 
// Module Name:    top 
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
module top(winrnd, clk, rst, leds_on, clear, led_control);
	 
	input winrnd;
	input clk;
	input rst;
	output leds_on;
	output clear;
	output [1:0] led_control;


	//Don't initialize rand, and slowen

	div256 myDiv256(
		.clk(clk),
		.rst(rst), 
		.slowen(slowen)
	);

	random myRandom(
		.clk(clk),
		.rst(rst),
		.rand(rand)
	);

	mc myMC(
		.slowen(slowen),
		.rand(rand),
		.winrnd(winrnd),
		.rst(rst),
		.clk(clk),
		.leds_on(leds_on),
		.clear(clear),
		.led_control(led_control)
	 );

endmodule
