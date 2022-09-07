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
