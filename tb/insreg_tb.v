`timescale 1ns/1ps
module IR_test;

reg clk;
reg reset;
reg load;
reg [7:0] ins;

wire [7:0] ir_out;
wire [2:0] opcode;
wire [4:0] operand;

IR uut(.clk(clk),
       .reset(reset),
       .load(load),
       .ins(ins),
       .ir_out(ir_out),
       .opcode(opcode),
       .operand(operand));

    always #5 clk = ~clk;

    initial begin
        $monitor("TIME : %0t, INSTRUCTION : %b, OPCODE : %b, OPERAND : %d", $time, ir_out, opcode, operand);

    end

    initial begin

        $dumpfile("dump_ir.vcd");
        $dumpvars(0, IR_test);

        clk = 1'b0;
        reset = 1'b1;
        load = 1'b0;
        #10;

        reset = 1'b0;
        ins = 8'b00000101;
        load = 1'b1;
        #10;

        load = 1'b0;
        #10;

        ins = 8'b00100011;
        load = 1'b1;
        #10

        load = 1'b0;
        #20;

        $finish;
    end

endmodule