module alu_test;

reg [7:0] A;
reg [7:0] B;
reg [2:0] alu_sel;

wire [7:0] result;
wire carry;
wire zero;

ALU uut(.A(A),
        .B(B),
        .alu_sel(alu_sel),
        .result(result),
        .carry(carry),
        .zero(zero));

    initial begin

        $dumpfile("alu_dump.vcd");
        $dumpvars(0, alu_test);

        A = 8'd6;
        B = 8'd3;

        alu_sel = 3'b000;
        #1;
        $display("ADD: A = %d, B = %d, Result = %d, Carry = %b, Zero = %b", A, B, result, carry, zero);
        #9;

        alu_sel = 3'b001;
        #1;
        $display("SUB: A = %d, B = %d, Result = %d, Carry = %b, Zero = %b", A, B, result, carry, zero);
        #9;

        alu_sel = 3'b010;
        #1;
        $display("AND: A = %b, B = %b, Result = %b, Carry = %b, Zero = %b", A, B, result, carry, zero);
        #9;

        alu_sel = 3'b011;
        #1;
        $display("0R: A = %b, B = %b, Result = %b, Carry = %b, Zero = %b", A, B, result, carry, zero);
        #9;

        alu_sel = 3'b100;
        #1;
        $display("XOR: A = %b, B = %b, Result = %b, Carry = %b, Zero = %b", A, B, result, carry, zero);
        #9;

        A = 8'd250;
        B = 8'd8;
        alu_sel = 3'b000;
        #1;
        $display("CARRY TEST: A = %d, B = %d, Result = %d, Carry = %b, Zero = %b", A, B, result, carry, zero);
        #9;

        $finish;

    end

endmodule


