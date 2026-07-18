module RAM(input clk,
           input we,
           input [3:0] addr,
           input [7:0] data_in,
           output [7:0] data_out);
    
    reg [7:0] memory [31:0];

    always @(posedge clk) begin

        if(we) begin

            memory[addr] <= data_in;
        end
    end

    assign data_out = memory[addr];

    initial begin //SAMPLE

        memory[0] = 8'd10;
        memory[1] = 8'd20;
        memory[2] = 8'd30;
        memory[3] = 8'd40;
        memory[4] = 8'd50;
    end


endmodule