module fulladder(x, y, carry_in, carry_out, z);
    input x;
    input y;
    input carry_in;
    output carry_out;
    output z;

    //1337 h4x
    assign {carry_out, z} = carry_in + x + y;
    
endmodule

module adder8bit(clk, x, y, carry_in, carry_out, z);
    input clk;
    input x;
    input y;
    input carry_in;
    output carry_out;
    output [7:0] z;
    
    wire c1;
    wire c2;
    wire c3;
    wire c4;
    wire c5;
    wire c6;
    wire c7;

    fulladder first(.x(x[0]), .y(y[0]), .carry_in(cin), .sum(sum[0]), .carry_out(c1));
    fulladder second(.x(x[1]), .y(y[1]), .carry_in(c1), .sum(sum[1]), .carry_out(c2));
    fulladder third(.x(x[2]), .y(y[2]), .carry_in(c2), .sum(sum[2]), .carry_out(c3));
    fulladder fourth(.x(x[3]), .y(y[3]), .carry_in(c3), .sum(sum[3]), .carry_out(c4));
    fulladder fifth(.x(x[4]), .y(y[4]), .carry_in(c4), .sum(sum[4]), .carry_out(c5));
    fulladder sixth(.x(x[5]), .y(y[5]), .carry_in(c5), .sum(sum[5]), .carry_out(c6));
    fulladder third(.x(x[6]), .y(y[6]), .carry_in(c6), .sum(sum[6]), .carry_out(c7));
    fulladder fourth(.x(x[7]), .y(y[7]), .carry_in(c7), .sum(sum[7]), .carry_out(carry_out));

endmodule
