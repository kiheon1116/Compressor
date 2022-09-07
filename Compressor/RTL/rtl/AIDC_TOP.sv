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

    STREAM_FIFOS_INTF           comp_flag_fifos_if,

    APB_INTF                    apb_intf
);

    // Comp interface (sop, eop, valid, ready, data)
    STREAM_INTF                 comp_icnt_intf (.clk(clk));          // icnt <-> Comp
    STREAM_INTF                 comp_mc_intf (.clk(clk));          // icnt <-> Comp


    // COMP - input interface
    assign  comp_icnt_intf.valid = icnt_w_intf.wvalid;
    assign  comp_icnt_intf.data  = icnt_w_intf.wdata;
    assign  comp_icnt_intf.eop   = icnt_w_intf.wlast;
    assign  icnt_w_intf.wready  = comp_icnt_intf.ready;

    // COMP - output interface
    assign mc_w_intf.wvalid = comp_mc_intf.valid;
    assign mc_w_intf.wdata = comp_mc_intf.data;
    assign mc_w_intf.wlast = comp_mc_intf.eop;
    assign comp_mc_intf.ready = mc_w_intf.wready;

     SOP_GEN                     u_sop_gen_comp (
          .clk                    (clk),
          .rst_n                  (rst_n),
          .valid_i                (icnt_w_intf.wvalid),
          .ready_i                (icnt_w_intf.wready),
          .last_i                 (icnt_w_intf.wlast),
          .sop_o                  (comp_icnt_intf.sop)
     );


    COMP_TOP u_comp (
        .clk                    (clk),
        .rst_n                  (rst_n),

        // comp_flag
        .comp_flag              (comp_flag_fifos_if.comp_flag),
        .comp_flag_valid        (comp_flag_fifos_if.comp_flag_valid),

        // icnt W
        .comp_icnt_intf         (comp_icnt_intf),

        // mc W
        .comp_mc_intf           (comp_mc_intf)
    );

/*
    STREAM_INTF                 decomp_icnt_intf (.clk(clk));

    assign  decomp_icnt_intf.valid = mc_r_intf.rvalid;
    assign  decomp_icnt_intf.data= mc_r_intf.rdata;
    assign  decomp_icnt_intf.eop = mc_r_intf.rlast;
    assign  mc_r_intf.rready    = decomp_icnt_intf.ready;

    SOP_GEN                     u_sop_gen_decomp (
        .clk                    (clk),
        .rst_n                  (rst_n),
        .valid_i                (mc_r_intf.rvalid),
        .ready_i                (mc_r_intf.rready),
        .last_i                 (mc_r_intf.rlast),
        .sop_o                  (decomp_icnt_intf.sop)
    );

    DECOMP_TOP u_decomp (
        .clk                    (clk),
        .rst_n                  (rst_n),

        // input data
        .data_i                 (decomp_icnt_intf.data),
        .valid_i                (decomp_icnt_intf.valid),
        .sop_i                  (sop_comp),        // sop = sop_comp , instead decomp_icnt_intf.sop
        .eop_i                  (decomp_icnt_intf.eop),
        .ready_o                (decomp_icnt_intf.ready),

        // r_channel on-chip interconnect AXI
        .ready_i                (icnt_r_intf.rready),        // rready_i = 1
        .data_o                 (icnt_r_intf.rdata),
        .valid_o                (icnt_r_intf.rvalid),
        .sop_o                  (sop_decomp),
        .eop_o                  (icnt_r_intf.rlast)
    );
*/
endmodule
