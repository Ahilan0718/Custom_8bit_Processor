`timescale 1ns/1ps

module control_fsm_test;

reg clk;
reg reset;

wire [1:0] state;
wire load_ir;
wire inc_pc;

control_fsm uut(.clk(clk),
                .reset(reset),
                .state(state),
                .load_ir(load_ir),
                .inc_pc(inc_pc));

    always #5 clk = ~clk;

    always @(state) begin

        case(state) 
            
            2'b00: $display("STATE : FETCH");
            2'b01: $display("STATE : DECODE");
            2'b10: $display("STATE : EXECUTE");

        endcase
    end

    initial begin

        $dumpfile("dump_fsm.v");
        $dumpvars(0, control_fsm_test);
        $monitor("TIME: %0t, STATE: %b, LOAD_IR: %b, INCREMENT_PC: %b", $time, state, load_ir, inc_pc);

        clk = 1'b0;
        reset = 1'b1;
        #10;

        reset = 1'b0;
        #100;

        $finish;
    end

endmodule