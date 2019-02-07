`timescale 1ns / 1ps

module div256(clk, rst, slowen);
  input clk;
  input rst;
  output slowen;

  //On the 256th clock cycle, this circuit will output a single slowen signal (1 clock cycle long)
  //Need an 8-bit counter to count up to 255
  reg [7:0] count;

  always@(posedge clk or posedge rst)
  begin
    if(rst) count<= 0;
    else count <= count + 1;
  end

  //Using reduction AND to obtain pulse only at 8'b11111111
  assign slowen = &count;

endmodule
