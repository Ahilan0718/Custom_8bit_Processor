module PC(input clk,
          input reset,
          input load,
          input inc,
          input [7:0] addr,
          output reg [7:0] pc_out);

    always @(posedge clk) begin

        if(reset) begin
            pc_out <= 8'd0;
        end

        else if(load) begin //LOAD
            pc_out <= addr;
        end
        
        else if(inc) begin //INCREMENT
            pc_out <= pc_out + 8'd1;
        end

    end

endmodule
