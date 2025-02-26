///////////////////////////
//    MAIN HEADER FILE   //
//        FOR RTL        //
///////////////////////////

///////////////////////////
// Configuration section //
///////////////////////////

/* Select one ISA base: */
// `define ISA_RV32I
// `define ISA_RV32E
`define ISA_RV64I
// `define ISA_RV64E

/* Select extensions: */
// None supported currently

///////////////////////////
//     Macro section     //
///////////////////////////
`ifdef ISA_RV32I
`define ISA_BIT_32

`elsif ISA_RV32E
`define ISA_BIT_32
`define ISA_EMBEDDED

`elsif ISA_RV64I
`define ISA_BIT_64

`elsif ISA_RV64E
`define ISA_BIT_64
`define ISA_EMBEDDED

`else
`error "Error: No ISA base was configured"
`endif

`ifdef ISA_BIT_64
`define ISA_WIDTH 64
`elsif ISA_BIT_32
`define ISA_WIDTH 32
`else
`error "Error: Unsupported ISA word width"
`endif
