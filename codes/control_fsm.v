module control_fsm(input clk,
                   input reset,
                   input [3:0] opcode,
                   input carry_flag,
                   input zero_flag,
                   output reg [1:0] state,
                   output reg load_ir,
                   output reg inc_pc,
                   output reg load_out,
                   output reg load_pc,
                   output reg load_acc,
                   output reg load_carry_flag,
                   output reg load_zero_flag,
                   output reg ram_we,
                   output reg [2:0] alu_sel);

    localparam FETCH = 2'b00;
    localparam DECODE = 2'b01;
    localparam EXECUTE = 2'b10;

    always @(posedge clk) begin

        if(reset) begin
            state <= FETCH;
        end

        else begin
            case(state) 

                FETCH: state <= DECODE;

                DECODE: state <= EXECUTE;

                EXECUTE: state <= FETCH;

                default: state <= FETCH;

            endcase
        end
    end

    always @(*) begin

        alu_sel = 3'b000;
        load_ir = 1'b0;
        inc_pc = 1'b0;
        load_acc = 1'b0;
        load_out = 1'b0;
        load_pc = 1'b0;
        load_carry_flag = 1'b0;
        load_zero_flag = 1'b0;
        ram_we = 1'b0;

        case(state) 

            FETCH: begin
                load_ir = 1'b1;
                inc_pc = 1'b1;
            end

            DECODE: begin
                load_ir = 1'b0;
                inc_pc = 1'b0;
            end

            EXECUTE: begin
                load_ir = 1'b0;
                inc_pc = 1'b0;

                case(opcode) 

                    4'b0000: begin //LOAD Immediate

                        load_acc = 1'b1;
                        alu_sel = 3'b110;
                    end
                    
                    4'b0001: begin //LOAD Memory

                        load_acc = 1'b1;
                        alu_sel = 3'b110;
                    end

                    4'b0010: begin //STORE Memory

                        ram_we = 1'b1;
                    end

                    4'b0011: begin //ADD

                        load_acc = 1'b1;
                        alu_sel = 3'b000;
                        load_carry_flag = 1'b1;
                        load_zero_flag = 1'b1;
                    end

                    4'b0100: begin //SUB

                        load_acc = 1'b1;
                        alu_sel = 3'b001;
                        load_carry_flag = 1'b1;
                        load_zero_flag = 1'b1;
                    end

                    4'b0101: begin //AND

                        load_acc = 1'b1;
                        load_zero_flag = 1'b1;
                        alu_sel = 3'b010;
                    end

                    4'b0110: begin //OR

                        load_acc = 1'b1;
                        load_zero_flag = 1'b1;
                        alu_sel = 3'b011;
                    end

                    4'b0111: begin //XOR

                        load_acc = 1'b1;
                        load_zero_flag = 1'b1;
                        alu_sel = 3'b100;
                    end

                    4'b1000: begin //NOT

                        load_acc = 1'b1;
                        load_zero_flag = 1'b1;
                        alu_sel = 3'b101;
                    end

                    4'b1001: begin //OUT

                        load_out = 1'b1;
                    end

                    4'b1010: begin //JMP

                        load_pc = 1'b1;
                    end

                    4'b1011: begin //JZ

                        if(zero_flag) begin

                            load_pc = 1'b1;
                        end
                    end

                    4'b1100: begin //JNZ

                        if(!zero_flag) begin

                            load_pc = 1'b1;
                        end
                    end

                    4'b1101: begin //UNUSED 1
                    end

                    4'b1110: begin //UNUSED 2
                    end

                    4'b1111: begin //UNUSED 3
                    end

                endcase
            end
        endcase
    end

endmodule



    