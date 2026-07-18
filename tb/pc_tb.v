`timescale 1ns/1ps

module pc_tb;

reg clk;
reg reset;
reg load;
reg inc;
reg [7:0] addr;

wire [7:0] pc_out;

PC uut(.clk(clk),
       .reset(reset),
       .load(load),
       .inc(inc),
       .addr(addr),
       .pc_out(pc_out));

    always #5 clk = ~clk;

    initial begin

        $dumpfile("pc_dump.vcd");
        $dumpvars(0, pc_tb);
        
        clk = 1'b0;
        reset = 1'b1;
        load = 1'b0;
        inc = 1'b0;
        addr = 8'd0;

        #10;
        reset = 1'b0;
        inc = 1'b1;

        #30;
        inc = 1'b0;
        addr = 8'd5;
        load = 1'b1;

        #10;
        load = 1'b0;
        inc = 1'b1;

        #20;

        $finish;
    end

endmodule