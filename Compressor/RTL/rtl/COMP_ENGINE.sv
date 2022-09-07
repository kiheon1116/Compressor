module COMP_ENGINE #(
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

    input   wire  [63:0]  data_i,
    input   wire          valid_i,
    input   wire          ready_i,  //
    input   wire          sop_i,
    input   wire          eop_i,

    output  wire  [63:0]  data_o,
    output  wire          valid_o,
    output  wire          ready_o,  // icnt
    output  wire          sop_o,
    output  wire          eop_o
);

    wire  [151:0] bpc_data_mid;            // bpc  
    wire  [7:0]   bpc_size_mid;            // input ==  data : 152bit, size : 8bit, sop, eop, valid, ready
    wire          bpc_sop_mid;            // output ==  data : 63bit, size : 11bit, sop, eop, valid, ready
    wire          bpc_eop_mid;
    wire          bpc_valid_mid;
    wire          bpc_ready_out;
    wire          bpc_ready_in;
    wire  [63:0]  bpc_data_out;            
    wire  [10:0]  bpc_size_out;
    wire          bpc_d_valid;
    wire          bpc_s_valid;
    wire          bpc_ready_mid;

    wire  [63:0]  bpc_fifo_d_out;        // bpc_fifo
    wire          bpc_fifo_d_full;        // input ==  data, wr, rd
    wire          bpc_fifo_d_empty;        // output == data, full, empty, threshold,overflow, underflow,
    wire          bpc_fifo_d_th;
    wire          bpc_fifo_d_over;
    wire          bpc_fifo_d_under;
    wire  [10:0]  bpc_fifo_s_out;    // block 수로 나타내기 4bit의 형태로
    wire          bpc_fifo_s_full;
    wire          bpc_fifo_s_empty;
    wire          bpc_fifo_s_th;
    wire          bpc_fifo_s_over;
    wire          bpc_fifo_s_under;

    wire  [67:0]  zrl_data_mid;            // 
    wire  [6:0]   zrl_size_mid;
    wire          zrl_sop_mid;
    wire          zrl_eop_mid;
    wire          zrl_valid_mid;
    wire          zrl_ready_out;
    wire          zrl_ready_in;
    wire  [63:0]  zrl_data_out;
    wire  [10:0]  zrl_size_out;
    wire          zrl_d_valid;
    wire          zrl_s_valid;
    wire          zrl_ready_mid;
    
    wire  [63:0]  zrl_fifo_d_out;
    wire          zrl_fifo_d_full;
    wire          zrl_fifo_d_empty;
    wire          zrl_fifo_d_th;
    wire          zrl_fifo_d_over;
    wire          zrl_fifo_d_under;
    wire  [10:0]  zrl_fifo_s_out;
    wire          zrl_fifo_s_full;
    wire          zrl_fifo_s_empty;
    wire          zrl_fifo_s_th;
    wire          zrl_fifo_s_over;
    wire          zrl_fifo_s_under;

    wire  [63:0]  sr_data_out;
    wire          sr_size_out;
    wire          sr_ready_out;
    wire          sr_ready_in;
    wire          sr_d_valid;
    wire          sr_s_valid;
    
    wire  [63:0]  sr_fifo_d_out;
    wire          sr_fifo_d_full;
    wire          sr_fifo_d_empty;
    wire          sr_fifo_d_th;
    wire          sr_fifo_d_over;
    wire          sr_fifo_d_under;
    wire          sr_fifo_s_out;
    wire          sr_fifo_s_full;
    wire          sr_fifo_s_empty;
    wire          sr_fifo_s_th;
    wire          sr_fifo_s_over;
    wire          sr_fifo_s_under;



    wire          sop_in;
    wire          valid_in;

    BPC_COMP BE0
    (
    .data_i           (data_i),
    .valid_i          (valid_in),
    .sop_i            (sop_in),              // sop_i
    .eop_i            (eop_i),
    .rst_n            (rst_n),
    .clk              (clk),
    
    .data_o           (bpc_data_mid),
    .size_o           (bpc_size_mid),
    .sop_o            (bpc_sop_mid),
    .eop_o            (bpc_eop_mid),
    .valid_o          (bpc_valid_mid)
    );
    BPC_CODEBUF BEBUF
    (
    .data_i           (bpc_data_mid),
    .size_i           (bpc_size_mid),
    .valid_i          (bpc_valid_mid),
    .sop_i            (bpc_sop_mid),
    .eop_i            (bpc_eop_mid),
    .rst_n            (rst_n),
    .clk              (clk),

    .data_o           (bpc_data_out),
    .size_o           (bpc_size_out),
    .d_valid          (bpc_d_valid),
    .s_valid          (bpc_s_valid)
    );
    FIFO #(
        .BITWIDTH         (D_BITWIDTH),
    .STAGE            (D_STAGE),
    .STAGE_BITWIDTH   (D_STAGE_BITWIDTH)
    ) FIFO_BPC_D (
        .data_i           (bpc_data_out),
    .wr_i             (bpc_d_valid),
    .rd_i             (data_rd_bpc),
    .rst_n            (rst_n),
    .clk              (clk),

    .data_o           (bpc_fifo_d_out),
    .full_o           (bpc_fifo_d_full),
    .empty_o          (bpc_fifo_d_empty),
    .threshold_o      (bpc_fifo_d_th),
    .overflow_o       (bpc_fifo_d_over),
    .underflow_o      (bpc_fifo_d_under)
    );
    FIFO #(
        .BITWIDTH         (S_BITWIDTH),
    .STAGE            (S_STAGE),
    .STAGE_BITWIDTH   (S_STAGE_BITWIDTH)
    ) FIFO_BPC_S (
    .data_i           (bpc_size_out),
    .wr_i             (bpc_s_valid),
    .rd_i             (size_rd_all),
    .rst_n            (rst_n),
    .clk              (clk),

    .data_o           (bpc_fifo_s_out),
    .full_o           (bpc_fifo_s_full),
    .empty_o          (bpc_fifo_s_empty),
    .threshold_o      (bpc_fifo_s_th),
    .overflow_o       (bpc_fifo_s_over),
    .underflow_o      (bpc_fifo_s_under)
    );
    ZRL_COMP ZE0
    (
        .data_i           (data_i),
    .valid_i          (valid_in),
    .sop_i            (sop_in),             // sop_i
    .eop_i            (eop_i),
    .rst_n            (rst_n),
    .clk              (clk),

    .data_o           (zrl_data_mid),
    .size_o           (zrl_size_mid),
    .sop_o            (zrl_sop_mid),
    .eop_o            (zrl_eop_mid),
    .valid_o          (zrl_valid_mid)
    );
    ZRL_CODEBUF ZEBUF
    (
        .data_i           (zrl_data_mid),
    .size_i           (zrl_size_mid),
    .valid_i          (zrl_valid_mid),
    .ready_i           (ready_i),       // 22.09.07 kkh
    .sop_i            (zrl_sop_mid),
    .eop_i            (zrl_eop_mid),
    .rst_n            (rst_n),
    .clk              (clk),


    .data_o           (zrl_data_out),
    .size_o           (zrl_size_out),
    .d_valid          (zrl_d_valid),
    .s_valid          (zrl_s_valid)
    );
    FIFO #(
        .BITWIDTH         (D_BITWIDTH),
    .STAGE            (D_STAGE),
    .STAGE_BITWIDTH   (D_STAGE_BITWIDTH)
    ) FIFO_ZRL_D (
        .data_i           (zrl_data_out),
    .wr_i             (zrl_d_valid),
    .rd_i             (data_rd_zrl),
    .rst_n            (rst_n),
    .clk              (clk),

    .data_o           (zrl_fifo_d_out),
    .full_o           (zrl_fifo_d_full),
    .empty_o          (zrl_fifo_d_empty),
    .threshold_o      (zrl_fifo_d_th),
    .overflow_o       (zrl_fifo_d_over),
    .underflow_o      (zrl_fifo_d_under)
    );
    FIFO #(
        .BITWIDTH         (S_BITWIDTH),
    .STAGE            (S_STAGE),
    .STAGE_BITWIDTH   (S_STAGE_BITWIDTH)
    ) FIFO_ZRL_S (
        .data_i           (zrl_size_out),
    .wr_i             (zrl_s_valid),
    .rd_i             (size_rd_all),
    .rst_n            (rst_n),
    .clk              (clk),

    .data_o           (zrl_fifo_s_out),
    .full_o           (zrl_fifo_s_full),
    .empty_o          (zrl_fifo_s_empty),
    .threshold_o      (zrl_fifo_s_th),
    .overflow_o       (zrl_fifo_s_over),
    .underflow_o      (zrl_fifo_s_under)
    );
    SR_COMP SE0
    (
    .data_i           (data_i),
    .valid_i          (valid_in),
    .sop_i            (sop_in),             // sop_i
    .eop_i            (eop_i),
    
    .rst_n            (rst_n),
    .clk              (clk),
    
    .data_o           (sr_data_out),
    .size_o           (sr_size_out),
    .d_valid          (sr_d_valid),
    .s_valid          (sr_s_valid)
    );
    FIFO #(
    .BITWIDTH         (D_BITWIDTH),
    .STAGE            (D_STAGE),
    .STAGE_BITWIDTH   (D_STAGE_BITWIDTH)
    ) FIFO_SR_D (
    .data_i           (sr_data_out),
    .wr_i             (sr_d_valid),
    .rd_i             (data_rd_sr),
    .rst_n            (rst_n),
    .clk              (clk),

    .data_o           (sr_fifo_d_out),
    .full_o           (sr_fifo_d_full),
    .empty_o          (sr_fifo_d_empty),
    .threshold_o      (sr_fifo_d_th),
    .overflow_o       (sr_fifo_d_over),
    .underflow_o      (sr_fifo_d_under)
    );
    FIFO #(
    .BITWIDTH         (SR_BITWIDTH),
    .STAGE            (S_STAGE),
    .STAGE_BITWIDTH   (S_STAGE_BITWIDTH)
    ) FIFO_SR_S (
    .data_i           (sr_size_out),
    .wr_i             (sr_s_valid),
    .rd_i             (size_rd_all),
    .rst_n            (rst_n),
    .clk              (clk),

    .data_o           (sr_fifo_s_out),
    .full_o           (sr_fifo_s_full),
    .empty_o          (sr_fifo_s_empty),
    .threshold_o      (sr_fifo_s_th),
    .overflow_o       (sr_fifo_s_over),
    .underflow_o      (sr_fifo_s_under)
    );

    COMP_INTF #(
    .D_BITWIDTH        (D_BITWIDTH),
    .D_STAGE          (D_STAGE),
    .D_STAGE_BITWIDTH   (D_STAGE_BITWIDTH),
    .S_BITWIDTH         (S_BITWIDTH),
    .S_STAGE            (S_STAGE),
    .S_STAGE_BITWIDTH   (S_STAGE_BITWIDTH),
    .SR_BITWIDTH        (SR_BITWIDTH)    
    ) COMP_INTF0 (
    .rst_n            (rst_n),
    .clk              (clk),

    .valid_i            (valid_i),
    .sop_i              (sop_i),
    .ready_i            (ready_i),
    .sr_fifo_s_empty    (sr_fifo_s_empty),
    .bpc_fifo_s_empty   (bpc_fifo_s_empty),
    .zrl_fifo_s_empty   (zrl_fifo_s_empty),
    
    .sr_fifo_s_out    (sr_fifo_s_out),
    .bpc_fifo_s_out   (bpc_fifo_s_out),
    .zrl_fifo_s_out   (zrl_fifo_s_out),

    .sr_fifo_s_th    (sr_fifo_s_th),
    .bpc_fifo_s_th   (bpc_fifo_s_th),
    .zrl_fifo_s_th   (zrl_fifo_s_th),

    .sr_fifo_d_full    (sr_fifo_d_full),
    .bpc_fifo_d_full   (bpc_fifo_d_full),
    .zrl_fifo_d_full   (zrl_fifo_d_full),

    .sr_fifo_d_out    (sr_fifo_d_out),
    .bpc_fifo_d_out   (bpc_fifo_d_out),
    .zrl_fifo_d_out   (zrl_fifo_d_out),

    .valid_in       (valid_in),
    .sop_in         (sop_in),

    .ready_o        (ready_o),  // icnt
    .sop_o          (sop_o),
    .eop_o          (eop_o),
    .data_o         (data_o),
    .valid_o        (valid_o),

    .data_rd_bpc    (data_rd_bpc),
    .data_rd_zrl    (data_rd_zrl),
    .data_rd_sr    (data_rd_sr),

    .size_rd_all    (size_rd_all)
    );
    
endmodule
