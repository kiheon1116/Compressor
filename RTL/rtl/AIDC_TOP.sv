module AIDC_TOP
(
    input   wire                clk,
    input   wire                rst_n,

    // Interfaces with on-chip interconnect (icnt)
    AXI_AW_INTF                 icnt_aw_intf,
    AXI_W_INTF                  icnt_w_intf,
    AXI_B_INTF                  icnt_b_intf,
    AXI_AR_INTF                 icnt_ar_intf,
    AXI_R_INTF                  icnt_r_intf,

    // Interfaces with memory controller (mc)
    AXI_AW_INTF                 mc_aw_intf,
    AXI_W_INTF                  mc_w_intf,
    AXI_B_INTF                  mc_b_intf,
    AXI_AR_INTF                 mc_ar_intf,
    AXI_R_INTF                  mc_r_intf,

    APB_INTF                    apb_intf
);

    STREAM_INTF                 comp_idata_if (.clk(clk));

    assign  comp_idata_if.valid = icnt_w_intf.wvalid;
    assign  comp_idata_if.data  = icnt_w_intf.wdata;
    assign  comp_idata_if.eop   = icnt_w_intf.wlast;
    assign  icnt_w_intf.wready  = comp_idata_if.ready;

    SOP_GEN                     u_sop_gen_comp (
        .clk                    (clk),
        .rst_n                  (rst_n),
        .valid_i                (icnt_w_intf.wvalid),
        .ready_i                (icnt_w_intf.wready),
        .last_i                 (icnt_w_intf.wlast),
        .sop_o                  (comp_idata_if.sop)
    );

    wire    sop_comp;
    wire    sop_decomp;
    
    COMP_TOP u_comp (
        .clk                    (clk),
        .rst_n                  (rst_n),

        // input data
        .data_i                 (comp_idata_if.data),
        .valid_i                (comp_idata_if.valid),
        .sop_i                  (comp_idata_if.sop),
        .eop_i                  (comp_idata_if.eop),
        .ready_o                (comp_idata_if.ready),

        // output data
        .valid_o                (mc_w_intf.wvalid),
        .ready_i                (mc_w_intf.wready),
        .data_o                 (mc_w_intf.wdata),
        .sop_o                  (sop_comp), // temporary for feedback test
        .eop_o                  (mc_w_intf.wlast)
    );

/*
    STREAM_INTF                 decomp_idata_if (.clk(clk));

    assign  decomp_idata_if.valid = mc_r_intf.rvalid;
    assign  decomp_idata_if.data= mc_r_intf.rdata;
    assign  decomp_idata_if.eop = mc_r_intf.rlast;
    assign  mc_r_intf.rready    = decomp_idata_if.ready;

    SOP_GEN                     u_sop_gen_decomp (
        .clk                    (clk),
        .rst_n                  (rst_n),
        .valid_i                (mc_r_intf.rvalid),
        .ready_i                (mc_r_intf.rready),
        .last_i                 (mc_r_intf.rlast),
        .sop_o                  (decomp_idata_if.sop)
    );

    DECOMP_TOP u_decomp (
        .clk                    (clk),
        .rst_n                  (rst_n),

        // input data
        .data_i                 (decomp_idata_if.data),
        .valid_i                (decomp_idata_if.valid),
        .sop_i                  (sop_comp),        // sop = sop_comp , instead decomp_idata_if.sop
        .eop_i                  (decomp_idata_if.eop),
        .ready_o                (decomp_idata_if.ready),

        // r_channel on-chip interconnect AXI
        .ready_i                (icnt_r_intf.rready),        // rready_i = 1
        .data_o                 (icnt_r_intf.rdata),
        .valid_o                (icnt_r_intf.rvalid),
        .sop_o                  (sop_decomp),
        .eop_o                  (icnt_r_intf.rlast)
    );
*/
endmodule
