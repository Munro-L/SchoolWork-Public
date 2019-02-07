`timescale 1ns / 1ps

//Pseudorandom Sequence Generator
//Locks up if in the 0000 state

//Linear Feedback Shift Registers
module random(
  input clk,
  input rst,
  output rand
);

  reg  [9:0] lfsr;
  assign rand = lfsr[9];

  always @(posedge clk or posedge rst)
  begin
    if(rst) lfsr[9:0] <= 1; //non-zero
    else
    begin
      lfsr[8:0]<=lfsr[9:1];
      lfsr[9]<=lfsr[0]^lfsr[3]; //Using polynomial: X^10 + X^3 + 1
    end
  end
endmodule
