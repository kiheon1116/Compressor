`include "AMBA_TYPEDEFS.svh"

interface STREAM_INTF
#(
    parameter   DATA_WIDTH      = `AXI_DATA_WIDTH
 )
(
    input                       clk
);
    logic                       valid;
    logic   [DATA_WIDTH-1:0]    data;
    logic                       sop;
    logic                       eop;
    logic                       ready;

endinterface


interface STREAM_FIFOS_INTF
(
    input                       clk
);
    logic                       comp_flag;
    logic                       comp_flag_valid;

    clocking master_cb @(posedge clk);
    //default input #1 output #1;
        output comp_flag;
        output comp_flag_valid;
    endclocking

    clocking slave_cb @(posedge clk);
    //default input #1 output #1;
        input comp_flag;
        input comp_flag_valid;
    endclocking
    modport master (clocking master_cb, input clk);
    modport slave  (clocking slave_cb, input clk);
endinterface