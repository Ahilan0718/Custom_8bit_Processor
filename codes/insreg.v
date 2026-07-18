module IR(input clk,
          input reset,
          input load,
          input [7:0] ins,
          output reg [7:0] ir_out,
          output [3:0] opcode,
          output [3:0] operand);

    always @(posedge clk) begin

        if(reset) begin
            ir_out <= 8'd0;
        end
        else if(load) begin
            ir_out <= ins;
        end

    end

    assign opcode = ir_out[7:4]; //4-bit OPCODE
    assign operand = ir_out[3:0]; //4-bit OPERAND

endmodule