`timescale 1ns/1ps

module reg8bit_tb;

reg clk;
reg reset;
reg load;
reg [7:0] data;

wire [7:0] q;

reg8bit uut(.clk(clk), 
            .reset(reset),
            .load(load),
            .data(data),
            .q(q));

    always #5 clk = ~clk;

    initial begin

        $dumpfile("dump.vcd");
        $dumpvars(0, reg8bit_tb);

        clk = 1'b0;
        reset = 1'b1;
        load = 1'b0;
        data = 8'd0;

        #10;
        reset = 1'b0;
        data = 8'd5;
        load = 1'b1;

        #10;
        load = 1'b0;

        #10;
        data = 8'd20;
        load = 1'b1;

        #10;
        load = 1'b0;

        #20;

        $finish;
    end
    
endmodule
