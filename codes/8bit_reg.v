module reg8bit(input clk,
               input reset,
               input load,
               input [7:0] data,
               output reg [7:0] q);

    always @(posedge clk) begin //SYNCHRONOUS RESET

        if(reset) begin
            q <= 8'd0;
        end

        else if(load) begin
            q <= data;
        end

    end

endmodule