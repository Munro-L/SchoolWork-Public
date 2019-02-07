module main(x, y);
    input [2:0] x;
    output [5:0] y;
    reg [2:0] x;
    reg [5:0] y;
    
    assign y[0] = x[0]
    assign y[1] = 0;
    assign y[2] = x[1] & ~x[2];
    assign y[3] = x[2] & ((x[0] & ~x[1]) + (~x[0] & x[1]));
    assign y[4] = x[0] & ~x[1];
    assign y[5] = x[0] & x[1];
    
endmodule
