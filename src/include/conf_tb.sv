///////////////////////////
//    MAIN HEADER FILE   //
//         FOR TB        //
///////////////////////////

///////////////////////////
// Configuration section //
///////////////////////////

`define VERILATOR_WAVE_FILE "dist/wave.vcd"

///////////////////////////
//     Macro section     //
///////////////////////////

// Clock generator & simulation clock cycle limit
`define TB_CLK(clk, period, limit) \
    reg clk = 0; \
    integer __tb_clk_cycles_``clk = 0; \
    always begin \
        clk <= ~clk; \
        __tb_clk_cycles_``clk <= __tb_clk_cycles_``clk + 1; \
        assert (__tb_clk_cycles_``clk < ((limit) * 2)) \
            else $error("Simulation finished"); \
        #(period/2); \
    end

// For Verilator testbench
`ifdef VERILATOR

// Initial block to dump waveforms
`define TB_INITIAL \
    initial begin \
        $dumpfile(`VERILATOR_WAVE_FILE); \
        $dumpvars(); \
    end


`endif


`ifndef TB_INITIAL
`define TB_INITIAL
`endif
