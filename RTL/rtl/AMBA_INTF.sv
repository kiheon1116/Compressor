`include "AMBA_TYPEDEFS.svh"

interface AXI_AW_INTF
#(
    parameter   ADDR_WIDTH      = `AXI_ADDR_WIDTH,
    parameter   ID_WIDTH        = `AXI_ID_WIDTH
 )
(
    input                       clk,
    input                       rst_n
);
    logic                       awvalid;
    logic                       awready;
    logic   [ID_WIDTH-1:0]      awid;
    logic   [ADDR_WIDTH-1:0]    awaddr;
    logic   [3:0]               awlen;
    logic   [2:0]               awsize;
    logic   [1:0]               awburst;

endinterface

interface AXI_W_INTF
#(
    parameter   DATA_WIDTH      = `AXI_DATA_WIDTH,
    parameter   ID_WIDTH        = `AXI_ID_WIDTH
 )
(
    input                       clk,
    input                       rst_n
);
    logic                       wvalid;
    logic                       wready;
    logic   [ID_WIDTH-1:0]      wid;
    logic   [DATA_WIDTH-1:0]    wdata;
    logic   [DATA_WIDTH/8-1:0]  wstrb;
    logic                       wlast;

    clocking driver_cb_w @(posedge clk);
        //default input #1 output #1;

        // on chip - w
        output          wid;    
        output          wdata;
        output          wstrb;
        output          wlast;
        output          wvalid;
        // dram - w
        input           wready;
    endclocking
    
    clocking driver_cb_wd @(posedge clk);
        //default input #1 output #1;

        // on chip - w
        input           wid;    
        input           wdata;
        input           wstrb;
        input           wlast;
        input           wvalid;
        // dram - w
        output          wready;
    endclocking

/*  clocking monitor_cb_wi @(posedge clk);
    //default input #1 output #1;

    // on chip - w
    input ready;
    // dram - w
    input id;
    input data;
    input strb;
    input last;
    input valid;

endclocking
*/
    clocking monitor_cb_wd @(posedge clk);
        //default input #1 output #1;

        // on chip - w
        input           wready;
        // dram - w
        input           wid;
        input           wdata;
        input           wstrb;
        input           wlast;
        input           wvalid;
    endclocking

    modport DRIVER_W (clocking driver_cb_w, input clk, rst_n);
    modport DRIVER_WD (clocking driver_cb_wd, input clk, rst_n);

    // modport MONITOR_WI (clocking monitor_cb_wi, input clk, rst_n);
    modport MONITOR_W (clocking monitor_cb_wd, input clk, rst_n);

endinterface

interface AXI_B_INTF
#(
    parameter   ID_WIDTH        = `AXI_ID_WIDTH
 )
(
    input                       clk,
    input                       rst_n
);
    logic                       bvalid;
    logic                       bready;
    logic   [ID_WIDTH-1:0]      bid;
    logic   [1:0]               bresp;

endinterface

interface AXI_AR_INTF
#(
    parameter   ADDR_WIDTH      = `AXI_ADDR_WIDTH,
    parameter   ID_WIDTH        = `AXI_ID_WIDTH
 )
(
    input                       clk,
    input                       rst_n
);
    logic                       arvalid;
    logic                       arready;
    logic   [ID_WIDTH-1:0]      arid;
    logic   [ADDR_WIDTH-1:0]    araddr;
    logic   [3:0]               arlen;
    logic   [2:0]               arsize;
    logic   [1:0]               arburst;

endinterface

interface AXI_R_INTF
#(
    parameter   DATA_WIDTH      = `AXI_DATA_WIDTH,
    parameter   ID_WIDTH        = `AXI_ID_WIDTH
 )
(
    input                       clk,
    input                       rst_n
);
    logic                       rvalid;
    logic                       rready;
    logic   [ID_WIDTH-1:0]      rid;
    logic   [DATA_WIDTH-1:0]    rdata;
    logic   [1:0]               rresp;
    logic                       rlast;

    // For verification
    // synthesis translate_off
    clocking driver_cb_rd @(posedge clk);
    //default input #1 output #1;

        // on chip - r
        input               rready;
        // dram - r
        output              rid;
        output              rdata;
        output              rresp;
        output              rlast;
        output              rvalid;
    endclocking

    clocking driver_cb_r @(posedge clk);
        default input #1 output #1;

        // on chip - r
        output          rready;
        // dram - r
        input           rid;
        input           rdata;
        input           rresp;
        input           rlast;
        input           rvalid;
    endclocking

    clocking monitor_cb_r @(posedge clk);
        //default input #1 output #1;

        // on chip - r
        input           rid;
        input           rresp;
        input           rdata;
        input           rlast;
        input           rvalid;
        // dram - r
        input           rready;
    endclocking

    modport DRIVER_RD (clocking driver_cb_rd, input clk, rst_n);
    modport DRIVER_R (clocking driver_cb_r, input clk, rst_n);

    //  modport MONITOR_RI (clocking monitor_cb_ri, input clk, rst_n);
    modport MONITOR_R (clocking monitor_cb_r, input clk, rst_n);
    // synthesis translate_on
endinterface

interface APB_INTF (
    input                       clk,
    input                       rst_n
);
    logic                       psel;
    logic                       penable;
    logic   [31:0]              paddr;
    logic                       pwrite;
    logic   [31:0]              pwdata;
    logic                       pready;
    logic   [31:0]              prdata;
    logic                       pslverr;

    modport master (
        input           clk,
        input           pready, prdata, pslverr,
        output          psel, penable, paddr, pwrite, pwdata
    );

    // synthesis translate_off
    task init();
        psel                    = 1'b0;
        penable                 = 1'b0;
        paddr                   = 32'd0;
        pwrite                  = 1'b0;
        pwdata                  = 32'd0;
    endtask

    task write(input int addr,
               input int data);
        #1
        psel                    = 1'b1;
        penable                 = 1'b0;
        paddr                   = addr;
        pwrite                  = 1'b1;
        pwdata                  = data;
        @(posedge clk);
        #1
        penable                 = 1'b1;
        @(posedge clk);

        while (pready==1'b0) begin
            @(posedge clk);
        end

        psel                    = 1'b0;
        penable                 = 1'b0;
        paddr                   = 'hX;
        pwrite                  = 1'bx;
        pwdata                  = 'hX;
    endtask

    task read(input int addr,
              output int data);
        #1
        psel                    = 1'b1;
        penable                 = 1'b0;
        paddr                   = addr;
        pwrite                  = 1'b0;
        pwdata                  = 'hX;
        @(posedge clk);
        #1
        penable                 = 1'b1;
        @(posedge clk);

        while (pready==1'b0) begin
            @(posedge clk);
        end
        data                    = prdata;

        psel                    = 1'b0;
        penable                 = 1'b0;
        paddr                   = 'hX;
        pwrite                  = 1'bx;
        pwdata                  = 'hX;
    endtask
    // synthesis translate_on

endinterface
