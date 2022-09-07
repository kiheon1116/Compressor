module COMP_TOP #(
    parameter   D_BITWIDTH        = 64,        // 64bit
    parameter   D_STAGE           = 32,
    parameter   D_STAGE_BITWIDTH  = $clog2(32),    // bitwidth
    parameter   S_BITWIDTH        = 11,
    parameter   S_STAGE           = 8,
    parameter   S_STAGE_BITWIDTH  = $clog2(8),  // 
    parameter   SR_BITWIDTH       = 1
) (
    input   wire          clk,
    input   wire          rst_n,

    input   wire        comp_flag,
    input   wire        comp_flag_valid,  

    STREAM_INTF         comp_icnt_intf, // icnt

    STREAM_INTF         comp_mc_intf  // mc
);

    // comp_engine interface
    STREAM_INTF         comp_engine_i_intf(.clk(clk));
    STREAM_INTF         comp_engine_o_intf(.clk(clk));

    COMP_ENGINE #(
    .D_BITWIDTH         (D_BITWIDTH),
    .D_STAGE            (D_STAGE),
    .D_STAGE_BITWIDTH   (D_STAGE_BITWIDTH),
    .S_BITWIDTH         (S_BITWIDTH),
    .S_STAGE            (S_STAGE),
    .S_STAGE_BITWIDTH   (S_STAGE_BITWIDTH),
    .SR_BITWIDTH        (SR_BITWIDTH)    
    ) u_COMP_ENGINE (
    .clk                (clk),
    .rst_n              (rst_n),

    .data_i             (comp_engine_i_intf.data),
    .valid_i            (comp_engine_i_intf.valid),
    .ready_i            (comp_engine_i_intf.ready), // mc
    .sop_i              (comp_engine_i_intf.sop),
    .eop_i              (comp_engine_i_intf.eop),

    .data_o             (comp_engine_o_intf.data),
    .valid_o            (comp_engine_o_intf.valid),
    .ready_o            (comp_engine_o_intf.ready), // icnt
    .sop_o              (comp_engine_o_intf.sop),
    .eop_o              (comp_engine_o_intf.eop)
    );

    
    COMP_MUX  #(
    .D_BITWIDTH         (D_BITWIDTH),
    .D_STAGE            (D_STAGE),
    .D_STAGE_BITWIDTH   (D_STAGE_BITWIDTH),
    .S_BITWIDTH         (1),
    .S_STAGE            (S_STAGE),
    .S_STAGE_BITWIDTH   (S_STAGE_BITWIDTH),
    .SR_BITWIDTH        (SR_BITWIDTH)    
    ) u_COMP_NONCOMP_MUX (
    .clk                (clk),
    .rst_n              (rst_n),

    .comp_flag          (comp_flag),
    .comp_flag_valid    (comp_flag_valid),
    
    // comp_top input
    .comp_icnt_intf         (comp_icnt_intf),
    
    // comp_engine
    .comp_engine_i_intf     (comp_engine_i_intf),
    .comp_engine_o_intf     (comp_engine_o_intf),   // 
    
    // comp_top output
    .comp_mc_intf           (comp_mc_intf)
    );
    
endmodule
