`timescale 1ns/1ps
module IM_test;

reg [7:0] address;

wire [7:0] instruction;

IM uut(.address(address),
       .instruction(instruction));

    initial begin

        $dumpfile("dump_im.vcd");
        $dumpvars(0, IM_test);

        $monitor("TIME: %0t, ADDRESS: %d, INSTRUCTION: %b", $time, address, instruction);

        address = 8'd0;
        #10;

        address = 8'd1;
        #10;

        address = 8'd2;
        #10;

        address = 8'd3;
        #10;

        address = 8'd4;
        #10

        $finish;
    end

endmodule