module ALU(input [7:0] A,
           input [7:0] B,
           input [2:0] alu_sel,
           output reg [7:0] result,
           output reg carry,
           output zero);

    always @(*) begin

        carry = 1'b0;

        case(alu_sel) 

            3'b000: begin //ADD
                {carry, result} = A + B;
            end

            3'b001: begin //SUB
                {carry, result} = A - B;
            end

            3'b010: begin //AND
                result = A & B;
                carry = 1'b0;
            end

            3'b011: begin //OR
                result = A | B;
                carry = 1'b0;
            end

            3'b100: begin //XOR
                result = A ^ B;
                carry = 1'b0;
            end

            3'b101: begin //NOT
                result = ~A;
                carry = 1'b0;
            end

            3'b110: begin //PASS B
                result = B;
                carry = 1'b0;
            end

            3'b111: begin //UNUSED
            end

            default: result = 8'd0;

        endcase
    end

    assign zero = (result == 8'd0);

endmodule

