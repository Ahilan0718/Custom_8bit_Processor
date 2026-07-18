module IM(input [7:0] address,
          output reg [7:0] instruction);

    always @(*) begin

        case(address) //SAMPLE INSTRUCTION SET

            8'd0: instruction = 8'b00001010; //LDI A
            8'd1: instruction = 8'b01010011; //AND 3
            8'd2: instruction = 8'b01100100; //OR 4
            8'd3: instruction = 8'b01110111; //XOR 7
            8'd4: instruction = 8'b10000000; //NOT (A)
            8'd5: instruction = 8'b01000001; //SUB 1
            8'd6: instruction = 8'b10010000; //OUT

            default: instruction = 8'b00000000;

        endcase
    end

endmodule