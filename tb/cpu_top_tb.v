module cpu_top_test;

reg clk;
reg reset;

cpu_top uut(.clk(clk),
            .reset(reset));

    always #5 clk = ~clk;

    initial begin

        $dumpfile("dump_cpu.vcd");
        $dumpvars(0, cpu_top_test);
        $monitor("TIME: %0t, STATE: %b, PC: %d, IR: %b, OPCODE: %b, OPERAND: %b, LOAD_ACC: %b, ALU SEL: %b, ALU RESULT: %d ACCUMULATOR: %d, LOAD_PC: %b, LOAD_CARRY_FLAG: %b, RAM_WE: %b, RAM_DATA: %d, OUT: %d", 
                  $time, uut.state, uut.pc_out, uut.instruction, uut.opcode, uut.operand, uut.load_acc, uut.alu_sel, uut.alu_result, uut.acc_out, uut.load_pc, uut.load_carry_flag, uut.ram_we, uut.ram_data, uut.out_reg);

        clk = 1'b0;
        reset = 1'b1;
        #10;

        reset = 1'b0;
        #500;
    
        $finish;
    end

endmodule