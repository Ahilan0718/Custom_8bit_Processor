module cpu_top(input clk,
               input reset,
               output [7:0] out_port,
               output [7:0] acc_port,
               output [7:0] pc_port);

    wire [7:0] pc_out;
    
    wire [7:0] ir_out;
    wire [3:0] opcode;
    wire [3:0] operand;

    wire [7:0] instruction;

    wire [1:0] state;
    wire load_ir;
    wire inc_pc;

    wire load_acc;
    wire [7:0] acc_out;

    wire carry;
    wire zero;
    wire [2:0] alu_sel;
    wire [7:0] alu_result;

    wire load_out;
    wire [7:0] out_reg;
    wire load_pc;

    wire load_carry_flag;
    wire load_zero_flag;
    wire carry_flag;
    wire zero_flag;

    wire ram_we;
    wire [7:0] ram_data;

    wire [7:0] alu_b;
    assign alu_b = (opcode == 4'b0001)? ram_data : {4'b0000, operand};
    assign out_port = out_reg;
    assign acc_port = acc_out;
    assign pc_port = pc_out;

    control_fsm fsm(.clk(clk),
                    .reset(reset),
                    .state(state),
                    .opcode(opcode),
                    .carry_flag(carry_flag),
                    .zero_flag(zero_flag),
                    .load_ir(load_ir),
                    .inc_pc(inc_pc),
                    .load_out(load_out),
                    .load_pc(load_pc),
                    .load_acc(load_acc),
                    .load_carry_flag(load_carry_flag),
                    .load_zero_flag(load_zero_flag),
                    .ram_we(ram_we),
                    .alu_sel(alu_sel));

    PC pc(.clk(clk),
        .reset(reset),
        .load(load_pc),
        .inc(inc_pc),
        .addr({4'b0000, operand}),
        .pc_out(pc_out));

    IM insmem(.address(pc_out),
            .instruction(instruction));

    IR insreg(.clk(clk),
            .reset(reset),
            .load(load_ir),
            .ins(instruction),
            .opcode(opcode),
            .operand(operand));

    reg8bit ACC(.clk(clk),
                .reset(reset),
                .load(load_acc),
                .data(alu_result),
                .q(acc_out));
    
    reg8bit OUT(.clk(clk),
                .reset(reset),
                .load(load_out),
                .data(acc_out),
                .q(out_reg));
    
    ALU alu(.A(acc_out),
            .B(alu_b),
            .alu_sel(alu_sel),
            .result(alu_result),
            .carry(carry),
            .zero(zero));

    flag FLAG(.clk(clk),
              .reset(reset),
              .load_carry_flag(load_carry_flag),
              .load_zero_flag(load_zero_flag),
              .carry_in(carry),
              .zero_in(zero),
              .carry_flag(carry_flag),
              .zero_flag(zero_flag));

    RAM ram(.clk(clk),
            .we(ram_we),
            .addr(operand),
            .data_in(acc_out),
            .data_out(ram_data));

endmodule

