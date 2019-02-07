`timescale 1ns / 1ps

module tow(
    input pbr,
    input pbl,
    input CLK_I,
    input rst,
    output [6:0] led_out
    );
	 
	 //wire pbr, pbl, CLK_I, rst;
	 //wire [6:0] led_out;
	 //wire [6:0] score;
//Complete wire signals needed below ???

	wire [6:0] score;
	wire [1:0] led_control;
	wire clk, clear, slowen, rand, push, sypush, leds_on, right, tie, winrnd;

//Slower Clock from 100Mhz to 500Hz -Given DO NOT remove 
clk_div createCLKdivide(.CLK_I(CLK_I),.rst(rst), .clk(clk));

//----------------------------------------------------------------------
//Instantiate PBL Sync OPP ??? 

pbl myPBL(.push(push), .tie(tie), .right(right), .pbr(pbr), .pbl(pbl), .clear(clear), .rst(rst));
synchro mySychr(.push(push), .clk(clk), .rst(rst), .sypush(sypush));
opp myOPP(.sypush(sypush), .clk(clk), .rst(rst), .winrnd(winrnd));


//----------------------------------------------------------------------
//Instantiate scorer Led_Mux pushCounter

scorer myScorer (.clk(clk),.rst(rst),.leds_on(leds_on),.right(right),.winrnd(winrnd),.score(score),.tie(tie));
led_mux my_LEDMUX (.score(score),.led_control(led_control),.led_out(led_out));

//----------------------------------------------------------------------
//Div256 LFSR MC speed_controller

	div256 myDiv256(.clk(clk),.rst(rst),.slowen(slowen));
	lfsr myRandom(.clk(clk),.rst(rst),.rand(rand));
	mc myMC(.slowen(slowen),.rand(rand),.winrnd(winrnd),.rst(rst),.clk(clk),.leds_on(leds_on),.clear(clear),.led_control(led_control));


/*
div256 createSLOWEN(clk,rst,slowen, slowen1024, slowen64);
lfsr createRAND(clk,rst,rand, randFake, randSpeed);
mc createMASTERCONTROLLER(winrnd,slowen,rand,randFake,randSpeed,clk,rst,speed_exit,winspeed,speed_round,leds_on,clear,led_control, fake);
speed_controller speed_controller(clk,rst,slowen, slowen1024,slowen64,speed_round,speed_tie,speed_right,speed_led,winspeed,speed_exit);
*/
endmodule


//Integration
/*module tow(
    input pbr,
    input pbl,
    input clk,
    input rst,
    output [6:0] leds_out
    );
	 
	 //wire pbr, pbl, CLK_I, rst;
	 //wire [6:0] leds_out;
	 //wire [6:0] score;
//Complete wire signals needed below ???

	wire [6:0] score;
	wire [1:0] led_control;

//Slower Clock from 100Mhz to 500Hz -Given DO NOT remove 
//clk_div createCLKdivide(.CLK_I(CLK_I),.rst(rst), .clk(clk));

//----------------------------------------------------------------------
//Instantiate PBL Sync OPP ??? 

pbl myPBL(.push(push), .tie(tie), .right(right), .pbr(pbr), .pbl(pbl), .clear(clear), .rst(rst));
synchro mySychr(.push(push), .clk(clk), .rst(rst), .sypush(sypush));
opp myOPP(.sypush(sypush), .clk(clk), .rst(rst), .winrnd(winrnd));


//----------------------------------------------------------------------
//Instantiate scorer Led_Mux pushCounter

scorer myScorer (.clk(clk),.rst(rst),.leds_on(leds_on),.right(right),.winrnd(winrnd),.score(score),.tie(tie));
led_mux my_LEDMUX (.score(score),.led_control(led_control),.leds_out(leds_out));

//----------------------------------------------------------------------
//Div256 LFSR MC speed_controller

	div256 myDiv256(.clk(clk),.rst(rst),.slowen(slowen));
	lfsr myRandom(.clk(clk),.rst(rst),.rand(rand));
	mc myMC(.slowen(slowen),.rand(rand),.winrnd(winrnd),.rst(rst),.clk(clk),.leds_on(leds_on),.clear(clear),.led_control(led_control));


//div256 createSLOWEN(clk,rst,slowen, slowen1024, slowen64);
//lfsr createRAND(clk,rst,rand, randFake, randSpeed);
//mc createMASTERCONTROLLER(winrnd,slowen,rand,randFake,randSpeed,clk,rst,speed_exit,winspeed,speed_round,leds_on,clear,led_control, fake);
//speed_controller speed_controller(clk,rst,slowen, slowen1024,slowen64,speed_round,speed_tie,speed_right,speed_led,winspeed,speed_exit);

endmodule*/