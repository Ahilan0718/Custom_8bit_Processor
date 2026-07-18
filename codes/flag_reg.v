module flag(input clk,
            input reset,
            input load_carry_flag,
            input load_zero_flag,
            input carry_in,
            input zero_in,
            output reg carry_flag,
            output reg zero_flag);

    always @(posedge clk) begin

        if(reset) begin

            carry_flag <= 1'b0;
            zero_flag <= 1'b0;
        end

        else begin

            if(load_carry_flag) begin

                carry_flag <= carry_in;
            end

            if(load_zero_flag) begin

                zero_flag <= zero_in;
            end
        end
    end

endmodule