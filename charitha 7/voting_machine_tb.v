`timescale 1ns / 1ps

module voting_machine_tb;

reg clk;
reg reset;
reg vote_a;
reg vote_b;
reg vote_c;
reg result;

wire [7:0] count_a;
wire [7:0] count_b;
wire [7:0] count_c;

voting_machine uut(
    .clk(clk),
    .reset(reset),
    .vote_a(vote_a),
    .vote_b(vote_b),
    .vote_c(vote_c),
    .result(result),
    .count_a(count_a),
    .count_b(count_b),
    .count_c(count_c)
);

always #5 clk = ~clk;

initial begin

    $dumpfile("voting_machine.vcd");
    $dumpvars(0,voting_machine_tb);

    clk = 0;
    reset = 1;
    vote_a = 0;
    vote_b = 0;
    vote_c = 0;
    result = 0;

    #10 reset = 0;

    // Vote Candidate A
    #10 vote_a = 1;
    #10 vote_a = 0;

    // Vote Candidate B
    #10 vote_b = 1;
    #10 vote_b = 0;

    // Vote Candidate C
    #10 vote_c = 1;
    #10 vote_c = 0;

    // Another Vote A
    #10 vote_a = 1;
    #10 vote_a = 0;

    // Another Vote B
    #10 vote_b = 1;
    #10 vote_b = 0;

    // Show Result
    #10 result = 1;

    #20;

    $display("----------------------------");
    $display("Candidate A Votes = %d",count_a);
    $display("Candidate B Votes = %d",count_b);
    $display("Candidate C Votes = %d",count_c);
    $display("----------------------------");

    #10 $finish;

end

endmodule