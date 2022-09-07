module tbench_top;

    bit clk;
    bit rst_n;
    int line;

    initial begin
        clk = 1;
    end

    always #5 clk = ~clk;

    initial begin
        rst_n = 1;
        #80 rst_n = 0;
        #80 rst_n = 1;
    end


    initial begin
        line = 0;
    end

    always #160 line = line + 1;

    initial begin
//        #7500;
//        #24000;    // FCL
//        #85420;
        #548150;
        $display("tb_finished");
        $finish;    
    end
    always #160 $display("%0d",line);
//    always #10  $display($time, "\t     data : %h -> %h -> %h -> %h    valid = %0d -> %0d -> %0d -> %0d    ready = %0d <- %0d <- %0d <- %0d  last = %0d -> %0d -> %0d -> %0d   sop  = %0d -> %0d -> %0d -> %0d    mode_c = %d, mode_d = %d ",    icnt_w_intf.wdata, mc_w_intf.wdata, mc_r_intf.rdata, icnt_r_intf.rdata,    icnt_w_intf.wvalid, mc_w_intf.wvalid, mc_r_intf.rvalid, icnt_r_intf.rvalid,     icnt_w_intf.wready, mc_w_intf.wready, mc_r_intf.rready, icnt_r_intf.rready, icnt_w_intf.wlast, mc_w_intf.wlast, mc_r_intf.rlast, icnt_r_intf.rlast ,  DUT.comp_idata_if.sop, DUT.sop_comp, DUT.sop_comp, DUT.sop_decomp, COMP_TOP.mode, DECOMP_TOP.mode);
    always #10 $monitor( "\t     data : %h -> %h -> %h -> %h    valid = %0d -> %0d -> %0d -> %0d    ready = %0d <- %0d <- %0d <- %0d  last = %0d -> %0d -> %0d -> %0d   sop  = %0d -> %0d -> %0d -> %0d    mode_c = %d, mode_d = %d ",    icnt_w_intf.wdata, mc_w_intf.wdata, mc_r_intf.rdata, icnt_r_intf.rdata,    icnt_w_intf.wvalid, mc_w_intf.wvalid, mc_r_intf.rvalid, icnt_r_intf.rvalid,     icnt_w_intf.wready, mc_w_intf.wready, mc_r_intf.rready, icnt_r_intf.rready, icnt_w_intf.wlast, mc_w_intf.wlast, mc_r_intf.rlast, icnt_r_intf.rlast ,  DUT.comp_idata_if.sop, DUT.sop_comp, DUT.sop_comp, DUT.sop_decomp, COMP_INTF.mode, DECOMP_TOP.mode);

/*    always #10  $display($time, "\t 
    data : %h -> %h -> %h -> %h    
    valid = %0d -> %0d -> %0d -> %0d      
    ready = %0d <- %0d <- %0d <- %0d  
    last = %0d -> %0d -> %0d -> %0d   
    sop  = %0d -> %0d -> %0d    mode_c = %d, mode_d = %d ",
    icnt_w_intf.data, mc_w_intf.data, mc_r_intf.data, icnt_r_intf.data,
    icnt_w_intf.valid, mc_w_intf.valid, mc_r_intf.valid, icnt_r_intf.valid, 
    icnt_w_intf.ready, mc_w_intf.ready, mc_r_intf.ready, icnt_r_intf.ready,
    icnt_w_intf.last, mc_w_intf.last, mc_r_intf.last, icnt_r_intf.last ,
    DUT.comp_idata_if.sop, DUT.sop_comp, DUT.sop_decomp, COMP_TOP.mode, DECOMP_TOP.mode);
*/
    AXI_AW_INTF         icnt_aw_intf (.clk(clk), .rst_n(rst_n));
    AXI_W_INTF          icnt_w_intf (.clk(clk), .rst_n(rst_n));
    AXI_B_INTF          icnt_b_intf (.clk(clk), .rst_n(rst_n));
    AXI_AR_INTF         icnt_ar_intf (.clk(clk), .rst_n(rst_n));
    AXI_R_INTF          icnt_r_intf (.clk(clk), .rst_n(rst_n));

    AXI_AW_INTF         mc_aw_intf (.clk(clk), .rst_n(rst_n));
    AXI_W_INTF          mc_w_intf (.clk(clk), .rst_n(rst_n));
    AXI_B_INTF          mc_b_intf (.clk(clk), .rst_n(rst_n));
    AXI_AR_INTF         mc_ar_intf (.clk(clk), .rst_n(rst_n));
    AXI_R_INTF          mc_r_intf (.clk(clk), .rst_n(rst_n));

    APB_INTF            apb_intf (.clk(clk), .rst_n(rst_n));

    // feed-back test
    assign  mc_r_intf.rvalid        = mc_w_intf.wvalid;
    assign  mc_r_intf.rdata         = mc_w_intf.wdata;
    assign  mc_r_intf.rlast         = mc_w_intf.wlast;
    assign  mc_w_intf.wready        = mc_r_intf.rready;

    test t1(icnt_w_intf, mc_w_intf, mc_r_intf, icnt_r_intf);


    AIDC_TOP DUT (
        .clk                    (clk),
        .rst_n                  (rst_n),

        .icnt_aw_intf           (icnt_aw_intf),
        .icnt_w_intf            (icnt_w_intf),
        .icnt_b_intf            (icnt_b_intf),
        .icnt_ar_intf           (icnt_ar_intf),
        .icnt_r_intf            (icnt_r_intf),

        .mc_aw_intf             (mc_aw_intf),
        .mc_w_intf              (mc_w_intf),
        .mc_b_intf              (mc_b_intf),
        .mc_ar_intf             (mc_ar_intf),
        .mc_r_intf              (mc_r_intf),

        .apb_intf               (apb_intf)
    );

endmodule
