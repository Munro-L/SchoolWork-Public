module main(x, y, clk, reset, z);
    input x;
    input y;
    input clk;
    input reset;
    output reg z;
    
    //states start at 1, fight me irl
    parameter S1 = 4'b0000;
    parameter S2 = 4'b0001;
    parameter S3 = 4'b0010;
    parameter S4 = 4'b0011;     //not used, go to default
    parameter S5 = 4'b0100;     //not used, go to default
    parameter S6 = 4'b0101;     //not used, go to default
    parameter S7 = 4'b0110;     //async reset
    parameter S8 = 4'b0111;     //not used, go to default
    parameter S9 = 4'b1000;
    parameter S10 = 4'b1001;
    parameter S11 = 4'b1010;    //not used, go to default
    parameter S12 = 4'b1011;    //not used, go to default
    parameter S13 = 4'b1100;    //not used, go to default
    parameter S14 = 4'b1101;    //not used, go to default
    parameter S15 = 4'b1110;    //not used, go to default
    parameter S16 = 4'b1111;    //not used, go to default
    
    reg [4:0] state;
    reg [4:0] next;
    
    //posedge reset does not care about clock, async
    always @(posedge clk or posedge reset)
    begin
        if (reset) state <= S7;
        else state <= next;
    end
    
    //decide on next state
    always @(state or x or y)
    begin
        case(state)
        S1: next = S1;
        S2: if (~y & x)
                next = S9;
            else if (~y & ~x)
                next = S3;
            else if (y)
                next = S1;
            
        S3: next = S1;
            
        S7: if (~y & ~x)
                next = S10;
            else if (~y & x)
                next = S9;
            else if (y)
                next = S7;
        
        S9: next = S3;
            
        S10: next = S2;
        
        default: next = S1;
        endcase
    end
    
    //output z depending on current state
    always @(state)
    begin
        case(state)
        S1: z=4'b0101;
        S2: z=4'b0100;
        S3: z=4'b0010;
        S7: z=4'b0000;
        S9: z=4'b0001;
        S10: z=4'b1001;
        default: z=4'b0000;
        endcase
    end
    
endmodule
