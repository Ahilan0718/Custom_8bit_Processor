`timescale 1ns/1ps

module fetch_tb;

reg clk;
reg reset;
reg inc;

wire [7:0] pc_out;
wire [7:0] instruction;

PC pc(.clk(clk),
      .reset(reset),
      .load(1'b0),
      .inc(inc),
      .addr(8'd0),
      .pc_out(pc_out));

IM im(.address(pc_out),
      .instruction(instruction));

    always #5 clk = ~clk;

    initial begin

        $dumpfile("fetch_dump.vcd");
        $dumpvars(0, fetch_tb);

        $monitor("TIME: %0t, PC ADDRESS: %d, INSTRUCTION: %b", $time, pc_out, instruction);

        clk = 1'b0;
        reset = 1'b1;
        inc = 1'b0;
        #10;

        reset = 1'b0;
        inc = 1'b1;
        #60;

        $finish;
    end

endmodule
