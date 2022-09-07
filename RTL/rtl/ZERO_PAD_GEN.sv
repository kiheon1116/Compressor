module ZERO_PAD_GEN
(
     input wire  [2:0]        comp_size,     // 
     input wire               done,          // engine done
     input wire               ready_i,       // from memory ctrl
     input wire               eop_i,

     output wire [63:0]       zero_pad_data,
     output wire               eop_o
);

reg  [2:0] cnt_r;
reg [63:0] zero_data;


// zero padding
always @(posedge clk) begin
     if(eop_i) begin
          cnt_r <= comp_size;
     end
     if(done & ready_i & comp_size) begin
          zero_data <= 'b0;
          cnt_r <= cnt_r - 1;
     end
end

// output signal
assign zero_pad_data = zero_data;