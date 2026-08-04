`timescale 1ns / 1ps

module voting_machine(
    input clk,
    input reset,
    input vote_a,
    input vote_b,
    input vote_c,
    input result,

    output reg [7:0] count_a,
    output reg [7:0] count_b,
    output reg [7:0] count_c
);

always @(posedge clk or posedge reset)
begin
    if(reset)
    begin
        count_a <= 8'd0;
        count_b <= 8'd0;
        count_c <= 8'd0;
    end
    else
    begin
        if(!result)
        begin
            if(vote_a)
                count_a <= count_a + 1;

            else if(vote_b)
                count_b <= count_b + 1;

            else if(vote_c)
                count_c <= count_c + 1;
        end
    end
end

endmodule