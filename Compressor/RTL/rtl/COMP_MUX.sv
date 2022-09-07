module COMP_MUX 
#(
     parameter   D_BITWIDTH        = 64,        // 64bit
     parameter   D_STAGE           = 32,
     parameter   D_STAGE_BITWIDTH  = $clog2(32),    // bitwidth
     parameter   S_BITWIDTH        = 1,
     parameter   S_STAGE           = 8,
     parameter   S_STAGE_BITWIDTH  = $clog2(8),  // 
     parameter   SR_BITWIDTH       = 1
) (
     input wire               clk,
     input wire               rst_n,
     
     input wire               comp_flag,
     input wire               comp_flag_valid,
     
     // input
     STREAM_INTF         comp_icnt_intf,

     // comp_engine
     STREAM_INTF         comp_engine_i_intf,        // comp_engine_i_ready = mc_ready_i;
     STREAM_INTF         comp_engine_o_intf,        // comp_engine_o_ready = icnt_ready_o;   

     // output
     STREAM_INTF         comp_mc_intf
);
     STREAM_INTF         non_comp_i_intf(.clk(clk));
     STREAM_INTF         non_comp_o_intf(.clk(clk));
     STREAM_INTF         comp_o_intf(.clk(clk));

     // data fifo
     wire comp_wr_i;
     wire comp_rd_i;

     wire comp_full_o;
     wire comp_empty_o;
     wire comp_threshold_o;
     wire comp_overflow_o;
     wire comp_underflow_o;

     wire  [65:0]   comp_data_packet_i;      // sop + eop + data
     wire  [65:0]   comp_data_packet_o;      // sop + eop + data
     
     // data fifo
     wire non_comp_wr_i;
     wire non_comp_rd_i;

     wire non_comp_full_o;
     wire non_comp_empty_o;
     wire non_comp_threshold_o;
     wire non_comp_overflow_o;
     wire non_comp_underflow_o;

     wire  [65:0]   non_comp_data_packet_i;      // sop + eop + data
     wire  [65:0]   non_comp_data_packet_o;      // sop + eop + data
     
     // size fifo
     wire      size_wr_i;
     wire      size_rd_i;
     wire      size_full_o;
     wire      size_empty_o;
     wire      size_threshold_o;
     wire      size_overflow_o;
     wire      size_underflow_o;

     wire      mux_sel;  // 1 : comp mode , 0 : non-comp mode
     wire      mc_handshake;

     reg [3:0] comp_flag_cnt;
     
     reg compress;
     reg non_compress;
     
     reg mode;
     wire size;

     wire compressing;
     wire non_compressing;

     wire holding;
     reg hold;
     reg wait_comp_flag;


     // -----------------------------------------------------------------------------------------------------------------------------
     // Common 
     
     // count            :       1   2   3   4   5   6   7   8   9   10  11  12  13  14  15  16  17  18  19  20  21  22  23  24  25  26  27  28  29  30  31  32  33  34  35  36  37  38 
     // clk              : __--__--__--__--__--__--__--__--__--__--__--__--__--__--__--__--__--__--__--__--__--__--__--__--__--__--__--__--__--__--__--__--__--__--__--__--__--__--__--__--__--__
     // icnt_handshake   :______---------------------------------------------------------------------------------------------      
     // data_i           :| D0       |D1 |D2 |D3 |D4 |D5 |D6 |D7 |D8 |D9 |D10|D11|D12|D13|D14|D15|D0 |D1 |D2 |D3 |D4 |D5 |D6 |D7 |D8 |D9 |D10|D11|D12|D13|D14|D15|
     // mc_handshake     :___________________________________________________________________________________________________________________________--------------------------------------------------
     // comp_data_o      :xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx|D0 |D1 |D2 |D3 |D4 |D5 |D6 |D7 |D8 |D9 |D10|D11|D12|D13|D14|D15|                              
     // comp_sop_o       :___________________________________________________________________________----____________________________________________________________
     // comp_eop_o       :_______________________________________________________________________________________________________________________________________----_______
                
     // non_comp_data_o  :xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx|D0 |D1 |D2 |D3 |D4 |D5 |D6 |D7 |D8 |D9 |D10|D11|D12|D13|D14|D15|    
     // non_comp_sop_o   :___________________________________________________________________________________________________________________________________________----_____________________________________________________________________     
     // non_comp_eop_o   :_______________________________________________________________________________________________________________________________________________________________________________________________________----_________
     // 
     // 
     // Comp_Top
          // input : valid(comp_icnt_intf) = 1, data(comp_icnt_intf) = data, sop/eop(comp_icnt_intf) = sop/eop, ready(comp_mc_intf) = 1
               // data_i 입력 (icnt_handshake) 

          // output : valid(comp_mc_intf) = 1, data(comp_mc_intf) = data, sop/eop(comp_mc_intf) = sop/eop, ready(comp_icnt_intf) = 1
               // Flag Fifo
                    // size_wr_i : icnt_handshake
                    // size_rd_i : mc_handshake
                    
                    //  comp_data 출력 (comp_engine_handshake)
                         // input  : valid(comp_engine_i) = 1, data(comp_engine_i) = data, sop/eop(comp_engine_i) = sop/eop, ready(comp_engine_o) = 1  
                         // output : valid(comp_engine_o) = 1, data(comp_engine_o) = data, sop/eop(comp_engine_o) = sop/eop, ready(comp_engine_i) = 1
                         
                         // Case 1 : comp_data 출력 o, non_comp engine 동작 x
                              // mux_sel : 1 / non_compress : 0

                         // Case 2 : comp_data 출력 o, non_comp engine hold 상태
                              // mux_sel : 1 / non_compress : 1

                    //  non_comp_data 출력 (non_comp_handshake)
                         // input  : valid(non_comp_valid) = 1, data(non_comp_data) = data, sop/eop(non_comp_sop/eop) = sop/eop, ready(non_comp_ready) = 1  
                         // output : valid(non_comp_valid) = 1, data(non_comp_data) = data, sop/eop(non_comp_sop/eop) = sop/eop, ready(non_comp_ready) = 1

                         // Case 3 : non_comp_data 출력 o, comp engine 동작 x
                              // mux_sel : 0 / compress : 0

                         // Case 4 : non_comp_data 출력 o, comp engine 동작 o (hold 상태)
                              // mux_sel : 0 / compress : 1

               // 둘다 출력되지 않는 상태
                    // Case 5 : comp_engine 동작 x , non_comp_engine 동작 x (icnt_handshake x, mc_handshake x)
                         // comp_icnt_intf.ready = 0, comp_icnt_intf.valid =0
                    // Case 6 : comp_engine 동작 o (data 출력 기다리는 중), non_comp_engine 동작 x

// -------------------------------------------------------------------------------------------
     // input assignments
     // DEMUX - icnt
     assign comp_engine_i_intf.valid    = (comp_flag & comp_flag_valid) ? comp_icnt_intf.valid : 0;
     assign comp_engine_i_intf.data     = (comp_flag & comp_flag_valid) ? comp_icnt_intf.data : 0;
     assign comp_engine_i_intf.sop      = (comp_flag & comp_flag_valid) ? comp_icnt_intf.sop : 0;
     assign comp_engine_i_intf.eop      = (comp_flag & comp_flag_valid) ? comp_icnt_intf.eop : 0;

     assign non_comp_i_intf.data       = (!comp_flag & comp_flag_valid) ? comp_icnt_intf.data : 'x;
     assign non_comp_i_intf.sop        = (!comp_flag & comp_flag_valid) ? comp_icnt_intf.sop : '0;
     assign non_comp_i_intf.eop        = (!comp_flag & comp_flag_valid) ? comp_icnt_intf.eop : '0;     

     // DEMUX - mc  
     assign comp_o_intf.ready    = !non_compressing & comp_mc_intf.ready;    // MC에서 1이면 common하게 나뉘어 들어감.
     assign non_comp_o_intf.ready      = !compressing & comp_mc_intf.ready;  // non comp는 data fifo가 almost full일때 제외 항상 ready.  
// -------------------------------------------------------------------------------------------

     // handshake
     assign icnt_handshake         = comp_icnt_intf.valid & comp_icnt_intf.ready;
     // assign non_comp_o_handshake   = non_comp_o_intf.valid & non_comp_o_intf.ready; 
     assign comp_o_handshake       = comp_engine_o_intf.valid & comp_engine_i_intf.ready;
     
     assign comp_data_packet_i     = (comp_wr_i) ? {comp_engine_o_intf.sop, comp_engine_o_intf.eop, comp_engine_o_intf.data} : 'x;
     
//     assign comp_wr_i              = (comp_flag) & comp_flag_valid & comp_o_handshake;                                  // (!comp_flag & comp_flag_valid) + icnt_handshake;
     assign comp_wr_i              = comp_o_handshake;                                  // (!comp_flag & comp_flag_valid) + icnt_handshake;
     
     assign comp_rd_i              = comp_o_intf.valid & comp_o_intf.ready & mode;                           

      // COMP DATA 
     FIFO_66 #(
     .BITWIDTH         (D_BITWIDTH+2),
     .STAGE            (D_STAGE),
     .STAGE_BITWIDTH   (D_STAGE_BITWIDTH)
     ) COMP_DATA (
     .data_i           (comp_data_packet_i),                 // non_comp data
     .wr_i             (comp_wr_i),                 // icnt_handshake + (comp_flag & comp_flag_valid)
     .rd_i             (comp_rd_i),                 // comp data와 동시에 출력. ()
     .rst_n            (rst_n),
     .clk              (clk),

     .data_o           (comp_data_packet_o),            // 현재 출력퇴는 non_comp_data
     .full_o           (comp_full_o),
     .empty_o          (comp_empty_o),
     .threshold_o      (comp_threshold_o),
     .overflow_o       (comp_overflow_o),
     .underflow_o      (comp_underflow_o)
     );



     // ---------------------------------------------------------------------------------------------------------------------
     // Case 2 : Non Comp   
     assign non_comp_data_packet_i     = (non_comp_wr_i) ? {non_comp_i_intf.sop, non_comp_i_intf.eop, non_comp_i_intf.data} : 'x;
     
     // assign non_comp_wr_i              = (!comp_flag) & comp_flag_valid & icnt_handshake;                                  // (!comp_flag & comp_flag_valid) + icnt_handshake;
     assign non_comp_wr_i              = (!comp_flag) & comp_flag_valid & icnt_handshake;                                  // (!comp_flag & comp_flag_valid) + icnt_handshake;
     
     assign non_comp_rd_i              = non_comp_o_intf.valid & non_comp_o_intf.ready & !mode;                           

      // NON COMP DATA - non_comp_o_intf.sop, comp_icnt_intf.eop, comp_icnt_intf.data
     FIFO_66 #(
     .BITWIDTH         (D_BITWIDTH+2),
     .STAGE            (D_STAGE),
     .STAGE_BITWIDTH   (D_STAGE_BITWIDTH)
     ) NON_COMP_DATA (
     .data_i           (non_comp_data_packet_i),                 // non_comp data
     .wr_i             (non_comp_wr_i),                 // icnt_handshake + (comp_flag & comp_flag_valid)
     .rd_i             (non_comp_rd_i),                 // comp data와 동시에 출력. ()
     .rst_n            (rst_n),
     .clk              (clk),

     .data_o           (non_comp_data_packet_o),            // 현재 출력퇴는 non_comp_data
     .full_o           (non_comp_full_o),
     .empty_o          (non_comp_empty_o),
     .threshold_o      (non_comp_threshold_o),
     .overflow_o       (non_comp_overflow_o),
     .underflow_o      (non_comp_underflow_o)
     );


     always @(*) begin
          if(!rst_n) begin         
               compress = 0;
          end
          else if (comp_o_intf.ready & comp_o_intf.valid & comp_o_intf.sop) begin
               compress = 1;
          end
          else if (!comp_o_intf.ready & comp_o_intf.valid & comp_o_intf.eop) begin
               compress = 1;
          end
          else if(comp_o_intf.ready & comp_o_intf.valid & comp_o_intf.eop) begin
               compress = 0;
          end
     end

     assign compressing = compress | comp_o_intf.eop;

     always @(*) begin
          if(!rst_n) begin
               non_compress = 0;
          end
          else if (non_comp_o_intf.ready & non_comp_o_intf.valid & non_comp_o_intf.sop) begin
               non_compress = 1;
          end
          else if (!non_comp_o_intf.ready & non_comp_o_intf.valid & non_comp_o_intf.eop) begin
               non_compress = 1;
          end
          else if (non_comp_o_intf.ready & non_comp_o_intf.valid & non_comp_o_intf.eop) begin
               non_compress = 0;
          end
     end                                                                             

     assign non_compressing = non_compress | non_comp_o_intf.eop;

     assign size_wr_i = comp_flag_valid & icnt_handshake & comp_icnt_intf.sop;
     assign size_rd_i = !size_empty_o & (!hold);

     // SIZE FIFO
     FIFO #(
     .BITWIDTH         (S_BITWIDTH),
     .STAGE            (S_STAGE),
     .STAGE_BITWIDTH   (S_STAGE_BITWIDTH)
     ) SIZE (
     .data_i           (comp_flag),                                                 // non_comp 인 경우 flag 값(0) 저장.
     .wr_i             (size_wr_i),                                           // flag_valid 일때 write (non_comp만 기록하므로)
     .rd_i             (size_rd_i),                  // 데이터를 comp_top 밖으로 내보낼 때 read하기. (앞의 데이터가 나가고 나서)
     .rst_n            (rst_n),
     .clk              (clk),

     .data_o           (mux_sel),                 
     .full_o           (size_full_o),
     .empty_o          (size_empty_o),
     .threshold_o      (size_threshold_o),
     .overflow_o       (size_overflow_o),
     .underflow_o      (size_underflow_o)
     );

     assign size = (size_rd_i) ? mux_sel :'x ;


     always @(*) begin             // default mode = non_comp
          if(!rst_n) begin
               mode = 0;
               wait_comp_flag = 0;
          end
          else if(size == 1 & comp_o_intf.valid) begin
               mode = 1;
          end
          else if(size == 0 & non_comp_o_intf.valid & !wait_comp_flag) begin
               mode = 0;
          end
          else if(size == 1 & !comp_o_intf.valid) begin
               mode = 0;
               wait_comp_flag = 1;
          end
          else if(hold & wait_comp_flag & comp_o_intf.valid & !non_compressing) begin
               mode = 1;
               wait_comp_flag = 0;
          end
     end

     always @(*) begin
          if(!rst_n) begin
               hold = 1;
          end
          else if(compress | non_compress) begin
               hold = 1;
          end
          else if(comp_o_intf.ready & comp_o_intf.valid & comp_o_intf.eop & !wait_comp_flag) begin
               hold = 0;
          end
          else if(non_comp_o_intf.ready & non_comp_o_intf.valid & non_comp_o_intf.eop & !wait_comp_flag) begin
               hold = 0;
          end
          else if(wait_comp_flag) begin
               hold = 1;
          end
     end

//     assign flush = !size_empty_o & ()

     // comp or non-comp가 끝날때 까지 hold하기 위한 case
     
     
     // non_comp output - icnt
     assign comp_engine_i_intf.ready    = !comp_full_o & comp_o_intf.ready;
     assign non_comp_i_intf.ready       = !non_comp_full_o & non_comp_o_intf.ready;
     // non_comp output - mc
     assign comp_o_intf.valid           = !comp_empty_o;
     assign non_comp_o_intf.valid       = !non_comp_empty_o;

     assign {comp_o_intf.sop,comp_o_intf.eop}          = (comp_rd_i) ? comp_data_packet_o[65:64] : '0;
     assign comp_o_intf.data                           = (comp_rd_i) ? comp_data_packet_o[63:0]  : 'x;

     assign {non_comp_o_intf.sop,non_comp_o_intf.eop}  = (non_comp_rd_i) ? non_comp_data_packet_o[65:64] : '0;
     assign non_comp_o_intf.data                       = (non_comp_rd_i) ? non_comp_data_packet_o[63:0]  : 'x;


     //-------------------------------------------------------------------------------------------------------------------------------
     // output assignments
     // MUX - icnt
     assign comp_icnt_intf.ready   = (comp_flag & comp_flag_valid) ? comp_engine_o_intf.ready :
                                      (!comp_flag & comp_flag_valid) ? non_comp_i_intf.ready : 'b0; 
     // MUX - MC
     assign comp_mc_intf.valid  = (mode) ? comp_o_intf.valid : non_comp_o_intf.valid;
     assign comp_mc_intf.data   = (mode) ? comp_o_intf.data : non_comp_o_intf.data;
     assign comp_mc_intf.eop    = (mode) ? comp_o_intf.eop : non_comp_o_intf.eop;
     assign comp_mc_intf.sop    = (mode) ? comp_o_intf.sop : non_comp_o_intf.sop;
     
     

endmodule
