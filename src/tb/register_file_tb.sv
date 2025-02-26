`include "conf_tb.sv"

module register_file_tb;

    `TB_INITIAL
    `TB_CLK(clk, 10, 10)

    reg [63:0] word_o = 2;
    reg [4:0] rs = 0;

    register_file dut(
        .clk(clk),
        .rst_n(1),
        .rs(rs),
        .rd(0),
        .store(0),

        .word_o(word_o)
    );

    initial begin
        #20; rs = 1;
        #20; rs = 2;
    end

endmodule
