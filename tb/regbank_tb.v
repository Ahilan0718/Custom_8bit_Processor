`timescale 1ns/1ps

module regbank_tb;

reg clk;
reg reset;
reg loadA;
reg loadB;
reg [7:0] dataA;
reg [7:0] dataB;

wire [7:0] qA;
wire [7:0] qB;

regbank uut(.clk(clk),
            .reset(reset),
            .loadA(loadA),
            .loadB(loadB),
            .dataA(dataA),
            .dataB(dataB),
            .qA(qA),
            .qB(qB));

    always #5 clk = ~clk;

    initial begin

        $dumpfile("dump.vcd");
        $dumpvars(0, regbank_tb);

        clk = 1'b0;
        reset = 1'b1;
        loadA = 1'b0;
        loadB = 1'b0;
        dataA = 8'd0;
        dataB = 8'd0;

        #10;
        reset = 1'b0;
        dataA = 8'd3;
        dataB = 8'd5;
        loadA = 1'b1;

        #10;
        loadA = 1'b0;
        loadB = 1'b1;

        #10;
        loadB = 1'b0;

        #10;
        dataA = 8'd4;
        dataB = 8'd6;
        loadA = 1'b1;
        loadB = 1'b1;

        #10;
        loadA = 1'b0;
        loadB = 1'b0;

        #20;

        $finish;
    end

endmodule 