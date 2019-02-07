`timescale 1ns / 1ps

//Pseudorandom Sequence Generator
//Locks up if in the 0000 state

//Linear Feedback Shift Registers
module lfsr(
  input clk,
  input rst,
  output rand
);

  reg  [9:0] shift;
  assign rand = shift[9];

  always @(posedge clk or posedge rst)
  begin
    if(rst) shift[9:0] <= 1; //non-zero
    else
    begin
      shift[8:0]<=shift[9:1];
      shift[9]<=shift[0]^shift[3]; //Using polynomial: X^10 + X^3 + 1
    end
  end
endmodule
