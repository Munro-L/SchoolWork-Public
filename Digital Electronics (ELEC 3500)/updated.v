`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date:    19:36:02 03/15/2018
// Design Name:
// Module Name:    mc
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

/*
	The controller times the action of the game as follows:

		1. Someone pushes a button either as a win or a jump light

			- If a player jumps the light, the light should change immediately.
			  However the timing is the same as for a legitimate push.

			- Also the controller should wait the "gloat period" and start the next round

		2. The LEDs will come on immediately after a button is pushed.
		3. The LEDs stay on for 1/2 to 1 second so it is clear who won
		  (so the movement of the lights can be observed and the winner can gloat)

		4. Then all the LEDs go out for a random time, minimum of 1/2 second to let's say 4 seconds (experiment)

			- After the LEDs go off, one must clear the push button latch.
			  The master controller sends out a CLEAR pulse to do this.

			  - This arms the push buttons quickly and allows detecting any player "jumping the light"
			    at any time except the first clock cycle of the dark period (1/250 of a second)

		5. A single LED comes back on after this random time

			- If the players are slow, the controller should keep the lights on until a push occurs

	*/

module mc(
    slowen,
	 rand,
	 winrnd,
	 rst,
	 clk,
	 leds_on,
	 clear,
	 led_control
	 );

	input slowen;	//acts as a slow clock (slow enable)
	input rand; 	//the bit string from the pseudorandom bit generator
	input winrnd; 	//goes high for one clock cycle after a button is pushed
	input clk;
	input rst;

	output leds_on;		//to say one or more LEDs are ON
	output clear; 			//controls the LED MUX to show the appropriate lights
	output led_control;	//generates clear signal to clear the push-button latch

	wire slowen, rand, winrnd;
	reg leds_on, clear;
	reg [1:0] led_control; //4 states (all on, all off, score, error) require 2 bits

	`define ALL_ON  3
	`define ALL_OFF  0
	`define SCORE  2
	`define ERROR  1

	`define Reset  0
	`define Wait_a  1
	`define Wait_b  2
	`define DarkRandom  3
	`define Play  4
	`define Gloat_a  5
	`define Gloat_b  6
	`define Gloat_c	7
	`define Gloat_d	8
	`define Gloat_e	9
	`define Gloat_f	10

	reg [2:0] state;
	reg [2:0] next_state;
	reg [4:0] count;	//for the animation so it can count slow enable pulses

	//FSM Logic
	always @(posedge clk or posedge rst)
	begin
		if(rst) state <= `Reset;
		else state <= next_state;
	end

	//Next State Logic
	always @(state or rst or slowen or winrnd or rand)
	begin
		case(state)
		`Reset:
			if(rst) next_state <= `Reset;
			else next_state <= `Wait_a;
		`Wait_a:
			if(slowen) next_state <= `Wait_b;
			else next_state <= `Wait_a;
		`Wait_b:
			if(slowen) next_state <= `DarkRandom;
			else next_state <= `Wait_b;
		`DarkRandom:
			if(winrnd) next_state <= `Gloat_a;
			else if(slowen&&rand) next_state <= `Play;
			else next_state <= `DarkRandom;
		`Play:
			if(winrnd) next_state <= `Gloat_a;
			else next_state <= `Play;
		`Gloat_a:
			if(slowen) next_state <= `Gloat_b;
			else next_state <= `Gloat_a;
		`Gloat_b:
			if(slowen) next_state <= `Gloat_c;
			else next_state <= `Gloat_b;
		`Gloat_c:
			if(slowen) next_state <= `Gloat_d;
			else next_state <= `Gloat_c;
		`Gloat_d:
			if(slowen) next_state <= `Gloat_e;
			else next_state <= `Gloat_d;
		`Gloat_e:
			if(slowen) next_state <= `Gloat_f;
			else next_state <= `Gloat_e;
		`Gloat_f:
			if(slowen) next_state <= `DarkRandom;
			else next_state <= `Gloat_f;
		default: next_state <= `Reset;
		endcase
	end

	//Output Logic
	always @(state)
	begin
		case(state)
		`Reset:						begin	clear = 1; leds_on = 1; led_control = `ALL_ON; 	end
		`Wait_a:						begin clear = 1; leds_on = 1; led_control = `ALL_ON; 	end
		`Wait_b:						begin	clear = 1; leds_on = 1; led_control = `ALL_ON; 	end
		`DarkRandom:				begin clear = 0; leds_on = 0; led_control = `ALL_OFF;	end
		`Play:						begin clear = 0; leds_on = 1; led_control = `SCORE; 	end
		`Gloat_a:					begin clear = 1; leds_on = 1; led_control = `SCORE; 	end
		`Gloat_b:					begin clear = 1; leds_on = 1; led_control = `SCORE; 	end
		`Gloat_c:					begin clear = 1; leds_on = 1; led_control = `Gloat_c; 	end
		`Gloat_d:					begin clear = 1; leds_on = 1; led_control = `Gloat_d; 	end
		`Gloat_e:					begin clear = 1; leds_on = 1; led_control = `Gloat_e; 	end
		`Gloat_d:					begin clear = 1; leds_on = 1; led_control = `Gloat_f; 	end
		default:						begin clear = 1; leds_on = 1; led_control = `ERROR; 	end
		endcase
	end

endmodule


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
	`define gloat1				4
	`define gloat2				5
	`define gloat3				6
	`define gloat4				7
	
	always @(led_control)
		begin
		case(led_control)
			`score_display: led_out = score;
			`gloat1: led_out = 7'b0001000;
			`gloat2: led_out = 7'b0010100;
			`gloat3: led_out = 7'b0100010;
			`gloat4: led_out = 7'b100001;
			`all_on: led_out = 7'b1111111;
			`all_off: led_out = 7'b0000000;
			`reset: led_out = 7'b1111011;
		endcase
	end
endmodule