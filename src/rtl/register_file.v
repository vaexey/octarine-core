`include "conf.v"

`define RF_REG_NAME(rx) reg_x``rx
`define RF_REG_DEF(rx) reg [`ISA_WIDTH-1:0] `RF_REG_NAME(rx) = {`ISA_WIDTH {1'b0}};

module register_file(
    input clk,
    input rst_n,

    input [4:0] rs, // Source register (load)
    input [4:0] rd, // Destination register (store)

    input store,

    output reg [`ISA_WIDTH-1:0] word_o = {`ISA_WIDTH {1'b0}}
);

    // ISA
    `RF_REG_DEF(1)

    always @(posedge clk, negedge rst_n) begin

        if(~rst_n)
            begin
                word_o <= {`ISA_WIDTH {1'b0}};
            end
        else
            begin
                case (rs)
                    5'd0: word_o <= 0;
                    5'd1: word_o <= `RF_REG_NAME(1);

                    default: word_o <= 1;
                endcase
            end

    end

endmodule

`undef RF_REG_NAME
`undef RF_REG
