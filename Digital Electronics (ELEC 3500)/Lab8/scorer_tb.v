//Testing scorer module
	
//=====================================================================================
// THE GOLDEN 2 RULES of testbenches!
//	1) Never change an input on a clock edge

		// to follow rule 1, we wait until the clock edge, 
		// and then move just past it before modifying the input

//	2) Only look at outputs when they are valid

//=====================================================================================
	
`timescale 1ns/1ns

module scorer_tb;

//=====================================================================================
//Setting up variables for the test bench
//=====================================================================================
	reg  leds_on, winrnd, tie, rst, right, clk;		// all inputs to the device are regs
	wire [6:0] score;									// output from the device is a wire
	reg [6:0] score_reg;								// a SAMPLED version of the device output
	
	//Updating the sampled version of the device output based on score
	//Updates one clock cycle after score
	always @(posedge clk or posedge rst)
		if(rst) score_reg <= 7'b0001000;
		else 	score_reg <= score;

	//Setting up clock to toggle every 10 ns (Each period is 20ns)
	always #10 clk <= ~clk;

//=====================================================================================
//Testing Scorer
//=====================================================================================
	initial begin
		// initialize all inputs
		clk = 0;		rst = 0;
		right = 0;	leds_on = 0;	winrnd = 0; tie = 0;
		
		//Resetting the system
		@(posedge clk); #5;		// waits for a clock edge, then moves just past it
		rst = 1;	
		
		//Removing the system from the system
		@(posedge clk); #1;		
		rst = 0;									// remove the system from reset
		
		@(posedge clk); #1;
		begin
			//[DEBUGGING] Testing initial state of system
			wait(score_reg == 7'b0001000) $display("%t - SUCCESS. Score was %b", $time, score_reg);
			
			//Move system to L1
			right = 0; leds_on = 1; winrnd = 1; //Left pushed first
		end
		
		@(posedge clk); #1;
		begin
			winrnd = 0;
			//[DEBUGGING] Testing if score register moves to L1
			wait(score_reg == 7'b0010000) $display("%t - SUCCESS. Score was %b", $time, score_reg);
			//Move system to L2
			right = 0; leds_on = 1; winrnd = 1; //Left pushed first
		end
		
		@(posedge clk); #1;
		begin
			winrnd = 0;
			//[DEBUGGING] Testing if score register moved to L2
			wait(score_reg == 7'b0100000) $display("%t - SUCCESS. Score was %b", $time, score_reg);
			//Moving system to L3
			//TEST 1 - Left pushes first from L2
			right = 0; leds_on = 1; winrnd = 1; //Left pushes first
		end
		
		
		@(posedge clk); #1;
		begin
			winrnd = 0;
			//[TEST 1] - Testing if score register moved to L3
			wait(score_reg == 7'b1000000) $display("%t - TEST 1 [Left pushed 1st from L2] SUCCESS. Score was %b", $time, score_reg);
			//Moving system back to L2
			right = 0; leds_on = 0; winrnd = 1; //Left jumped the gun
		end
	
		@(posedge clk); #1;
		begin
			winrnd = 0; 
			//[DEBUGGING] Testing if score register moved to L2
			wait(score_reg == 7'b0100000) $display("%t - SUCCESS. Score was %b", $time, score_reg);
			//Moving system to L1
			//TEST 2 - Right pushed first from L2
			right = 1; leds_on = 1; winrnd = 1;
		end
	
		@(posedge clk); #1;
		begin
			winrnd = 0;
			//[TEST 2] - Testing if score register moved to L1
			wait(score_reg == 7'b0010000) $display("%t - TEST 2 [Right pushed 1st from L2] SUCCESS. Score was %b", $time, score_reg);
			//Moving system to N
			right = 1; leds_on = 1; winrnd = 1;
		end
		
		@(posedge clk); #1;
		begin
			winrnd = 0;
			//[DEBUGGING] Testing if score register moved to N
			wait(score_reg == 7'b0001000) $display("%t - SUCCESS. Score was %b", $time, score_reg);
			//Moving system to R1
			right = 1; leds_on = 1; winrnd = 1;
		end
		
		@(posedge clk); #1;
		begin
			winrnd = 0;
			//[DEBUGGING] Testing if score register moved to R1
			wait(score_reg == 7'b0000100) $display("%t - SUCCESS. Score was %b", $time, score_reg);
			//Moving system to R2
			right = 1; leds_on = 1; winrnd = 1;
		end

		@(posedge clk); #1;
		begin
			winrnd = 0;
			//[DEBUGGING] Testing if score register moved to R2
			wait(score_reg == 7'b0000010) $display("%t - SUCCESS. Score was %b", $time, score_reg);
			//Moving system to R3
			right = 1; leds_on = 1; winrnd = 1;
		end

		@(posedge clk); #1;
		begin
			winrnd = 0;
			//[DEBUGGING] Testing if score register moved to R3
			wait(score_reg == 7'b0000001) $display("%t - SUCCESS. Score was %b", $time, score_reg);
			//Test 3 - left pushed first from R3
			//Moving system to R1
			right = 0; leds_on = 1; winrnd = 1; 
		end
		
		@(posedge clk); #1;
		begin
			winrnd = 0;
			//[Test 3] Testing if score register moved to R1
			wait(score_reg == 7'b0000100) $display("%t - TEST 3 [Left pushed 1st from R3] SUCCESS. Score was %b", $time, score_reg);
			//Moving system to R2
			right = 1; leds_on = 1; winrnd = 1;
		end

		@(posedge clk); #1;
		begin
			winrnd = 0;
			//[Debugging] Testing if score registor moved to R2
			wait(score_reg == 7'b0000010) $display("%t - SUCCESS. Score was %b", $time, score_reg);
			//Moving system to R3
			right = 1; leds_on = 1; winrnd = 1;
		end

		@(posedge clk); #1;
		begin
			winrnd = 0;
			//[Debugging] Testing if score registor moved to R3
			wait(score_reg == 7'b0000001) $display("%t - SUCCESS. Score was %b", $time, score_reg);
			//Test 4 - right jumping the light from R3
			//Moving system to R2
			right = 1; leds_on = 0; winrnd = 1;
		end

		@(posedge clk); #1;
		begin
			winrnd = 0;
			//[Test 4] Testing if score register moved to R2
			wait(score_reg == 7'b0000010) $display("%t - TEST 4 [Right jumping the light from R3] SUCCESS. Score was %b", $time, score_reg);
			//Moving system back to R3
			right = 1; leds_on = 1; winrnd = 1;
		end
	
		@(posedge clk); #1;
		begin
			winrnd = 0;
			//[Debugging] Testing if the score moved to R3
			wait(score_reg == 7'b0000001) $display("%t - SUCCESS. Score was %b", $time, score_reg);
			//Test 5 - right pushing first from R3
			//Moving system to WR
			right = 1; leds_on = 1; winrnd = 1;
		end

		@(posedge clk); #1;
		begin
			winrnd = 0;
			//[TEST 5] Testing if score registor moved to WR
			wait(score_reg == 7'b0000111) $display("%t - TEST 5 [Right pushing first from R3] SUCCESS. Score was %b", $time, score_reg);
			
			rst = 1;
		end	

		@(posedge clk); #1;
		begin
			rst = 0;
		end
	
		@(posedge clk); #1;
		begin
			//[DEBUGGING] Testing initial state of system
			wait(score_reg == 7'b0001000) $display("%t - SUCCESS. Score was %b", $time, score_reg);
			
			//Move system to L1
			right = 0; leds_on = 1; winrnd = 1; //Left pushed first
		end
		
		@(posedge clk); #1;
		begin 
			winrnd = 0;
			//[DEBUGGING] Testing that system is at L1
			wait(score_reg == 7'b0010000) $display("%t - SUCCESS. Score was %b", $time, score_reg);
		
			//[TEST 6] Testing tie, system should stay in same state
			right = 1; leds_on = 1; winrnd = 1; tie = 1; //Tie
		end
		
		@(posedge clk) #1;
		begin
			winrnd = 0;
			//[TEST 6] Testing that the system is still at L1
			wait(score_reg == 7'b0010000) $display("%t - TEST 6 [Tie occured] SUCCESS. Score was %b", $time, score_reg);
			rst = 1;
		end	

		@(posedge clk); #1;
		begin
			rst = 0;
		end
		
		$finish;
	end

// every time the clock falls, print out the value of the score
always @(posedge clk) $display("%t - CLKSAMPLE: Score sampled to be %d", $time, score_reg);

// set up statements to inform you when inputs change 
always @(rst) $display("%t - DATAMONITOR: rst signal changed to %b", $time, rst);

// and finally instantiate the device under test (DUT) 
scorer scorerinst (.clk(clk), .rst(rst), .leds_on(leds_on), .right(right), .winrnd(winrnd), .score(score), .tie(tie));

endmodule
