module COMP_INTF
#(
    parameter   D_BITWIDTH        = 64,        // 64bit
    parameter   D_STAGE           = 32,
    parameter   D_STAGE_BITWIDTH  = $clog2(32),    // bitwidth 5 
    parameter   S_BITWIDTH        = 11,
    parameter   S_STAGE           = 8,
    parameter   S_STAGE_BITWIDTH  = $clog2(8),  // 3
    parameter   SR_BITWIDTH       = 1
)
(
     input wire                              clk,
     input wire                              rst_n,
     // icnt
     input wire                              valid_i,  
     input wire                              sop_i,
     input wire                              ready_i,       // icnt - ready_o

     input wire                              sr_fifo_s_empty,
     input wire                              bpc_fifo_s_empty,
     input wire                              zrl_fifo_s_empty,

     input wire                              sr_fifo_s_out,
     input wire [10:0]                       bpc_fifo_s_out,
     input wire [10:0]                       zrl_fifo_s_out,

     input wire                              sr_fifo_s_th,
     input wire                              bpc_fifo_s_th,
     input wire                              zrl_fifo_s_th,

     input wire                              sr_fifo_d_full,
     input wire                              bpc_fifo_d_full,
     input wire                              zrl_fifo_d_full,

     input wire  [D_BITWIDTH-1 : 0]          sr_fifo_d_out,
     input wire  [D_BITWIDTH-1 : 0]          bpc_fifo_d_out,
     input wire  [D_BITWIDTH-1 : 0]          zrl_fifo_d_out,
     // engine input
     output wire                             valid_in,
     output wire                             sop_in,
     
     // engine output
     output wire                             ready_o,
     output wire                             sop_o,
     output wire                             eop_o,
     output wire        [D_BITWIDTH-1 : 0]   data_o,
     output wire                             valid_o,

     output wire                             data_rd_bpc,
     output wire                             data_rd_zrl,
     output wire                             data_rd_sr,

     output wire                             size_rd_all

);
     // in engine
     wire done;   
     wire [1:0] mode;
     wire [2:0] ok_flag;

     reg [3:0] bcnt, bcnt_n;
     

     reg  pad_flag;
     reg  pad_data;
     reg [3:0] zrl_cnt, bpc_cnt;

     reg data_rd_bpc_r, data_rd_sr_r, data_rd_zrl_r;
     reg size_rd_all_r;

     assign size_rd_all = size_rd_all_r;

     assign data_rd_bpc = data_rd_bpc_r;
     assign data_rd_zrl = data_rd_zrl_r;
     assign data_rd_sr = data_rd_sr_r;
     
     // output reg

     wire sr_ready_in, zrl_ready_in, bpc_ready_in;
     wire almost_full_flag;

     reg  sop_out, eop_out;

     
     

     // -----------------------------------------------------------
     // Timing diagram
     // -----------------------------------------------------------

     // ----------- input -------------

     // clk              : __--__--__--__--__--__--__--__--__--__--__--__--__--__--__--__--__--__--__--__--__--__--__--__--__--__--__--__--__--__--__--__--__--__--__
     // rst_n            : __----___________________________________________________________________________________________________________________
     // icnt_valid_i   * : ______----------------------------------------------------------------------------____________-------------------
     // icnt_ready_o   * : ______----____----____----____----____----____----____----____----____----____----____----____----____----____----____----____
     // sop_i          * : ______--------________________________________________________________________________________--------______ 
     // eop_i            : __________________________________________________________________________--------_______________________________________
     // addr_i           : ______  0 | 1     | 2     | 3     | 4     | 5     | 6     | ''''' |14     |15     | --------- | N1| N2 | N3 | N4 | 
     // data_i           : ______ D0 |D1     |D2     |D3     |D4     |D5     |D6     | ''''' |D14    |D15    | --------- | D1| D2 | D3 | D4 | 
     
     // sop_in           : ______----____________________________________________________________________________________----________________
     // valid_in         : ______----____----____----____----____----____----____----____----____----____----____________----____----

     // sop_in
     assign sop_in = (valid_i & ready_i & sop_i);     
           
     // valid_in : icnt - handshake
     assign valid_in = valid_i & ready_i;


     // ---------- in engine -----------
     
     // clk              : --__--__--__--__--__--__--__--__--__--__--__--__--__--__--__--__--__--__--__--__--__--__--__--__--__--__--__--__--__--__--__--__--__--__
     // mc_valid_o       : ________________________________------------------------------------------------------------------_____________------------------____________-------------------
     // mc_ready_i     * : ----____----____----____----____----____----____----____----____----____----____----____----____----____----____----____
     
     // eop_o            :   --------Engine cycle--------  |___________________________________________________--------_______________________________________
     // addr_o           :   --------Engine cycle--------  | 0 | 1     | 2     | 3     | 4     | 5     | 6     | 7     | ---------- |          
     // data_o           :   --------Engine cycle--------  |D0 |D1     |D2     |D3     |D4     |D5     |D6     |D7     | ---------- |

     // size_wr_bpc      :   --Engine cycle--------| size  |-----------------------------------------------------------|
     // size_wr_zrl      :   ---------| size  |------------------------------------------------------------------------|
     // size_wr_sr       :   | size  |---------------------------------------------------------------------------------|
     
     // size_rd_bpc      :   --------------------------------------Engine cycle------------------------------------|siz|
     // size_rd_zrl      :   --------------------------------------Engine cycle------------------------------------|siz|
     // size_rd_sr       :   ------------------------------------Engine cycle--------------------------------------|siz|

     // done           * : ________________________________--------------------------------------------------------_______________
     // bcnt           * : ________________________________| 0 | 1     | 2     | 3     | 4     | 5     | 6     | 7 |
     // bcnt_n           : ____________________________|0  | 1 | 2     | 3     | 4     | 5     | 6     | 7     | 0 |

     // done
     assign done = ((~sr_fifo_s_empty) & (~zrl_fifo_s_empty) & (~bpc_fifo_s_empty));
     // 기존 report
     // 각 fifo_size가 모두 empty가 아니면, done. but ready가 꺼진 경우...
     // ready_i & !valid_i & !empty_flag -> 일때 1 넣기.


     // bcnt - ff
     always @(posedge clk or negedge rst_n) begin
        if (~rst_n) begin
            bcnt     <= 'b0;
        end else begin
            bcnt     <= bcnt_n;
        end
     end

     // bcnt 
     always @(*) begin
        bcnt_n = bcnt;
        if(done & ready_i) begin
            bcnt_n = bcnt + 1;
        end
        else if(done & !ready_i) begin
            bcnt_n = bcnt;
        end
        else begin            
            bcnt_n = 0;        
        end                
     end
     
          
     // size_rd 
     always @(*) begin
        if(done & ready_i) begin
            size_rd_all_r  = (bcnt == 7);     // !ready_i 포함
        end
        else begin
            size_rd_all_r = 0;
        end
     end     


     // data_rd case 1 : 8 burst compressed
     // clk              : --__--__--__--__--__--__--__--__--__--__--__--__--__--__--__--__--__--__--__--__--__--__--__--__--__--__--__--__--__--__--__--__--__--__
     // mc_valid_o       : ________________________________------------------------------------------------------------------_____________------------------____________-------------------
     // mc_ready_i       : ----____----____----____----____----____----____----____----____----____----____----____----____----____----____----____
 

     // eop_o            :   --------Engine cycle--------  |___________________________________________________--------_______________________________________
     // addr_o           :   --------Engine cycle--------  | 0 | 1     | 2     | 3     | 4     | 5     | 6     | 7     | ---------- |          
     // data_o           :   --------Engine cycle--------  |D0 |D1     |D2     |D3     |D4     |D5     |D6     |D7     | ---------- |
     // data_bpc         :   --------Engine cycle--------  |b0 |bpc0   |bpc0   |bpc0   |bpc0   |bpc0   |bpc0   |bp7    | ---------- |
     // data_zrl         :   --------Engine cycle--------  |zr0|zrl1   |zrl2   |zrl3   |zrl4   |zrl5   |zrl6   |zrl7   | ---------- |
     // data_sr          :   --------Engine cycle--------  |sr0|sr1    |sr2    |sr3    |sr4    |sr5    |sr6    |sr7    | ---------- |


     // data_rd case 2 : 0 ~ 7 burst compressed
     // clk              : --__--__--__--__--__--__--__--__--__--__--__--__--__--__--__--__--__--__--__--__--__--__--__--__--__--__--__--__--__--__--__--__--__--__
     // mc_valid_o       : ________________________________------------------------------------------------------------------_____________------------------____________-------------------
     // mc_ready_i       : ----____----____----____----____----____----____----____----____----____----____----____----____----____----____----____
     
     // eop_o            :   --------Engine cycle--------  |_______________________________________________________----_______________________________________
     // addr_o           :   --------Engine cycle--------  | 0 | 1     | 2     | 3     | 4     | 5     | 6     | 7     | ---------- |          
     // data_o           :   --------Engine cycle--------  |D0 |D1     |D2     |D3     |D4     |D5     |D6     |D7     | ---------- |

     // data_bpc         :   --------Engine cycle--------  |bp0|bpc1   |bpc2   |bpc3   |-------------------------------- ---------- |
     // data_zrl         :   --------Engine cycle--------  |zr0|zrl1   |zrl2   |--------------------------------------------------- |
     // data_sr          :   --------Engine cycle--------  |sr0|sr1    |sr2    |sr3    |sr4    |sr5    |sr6    |sr7    | ---------- |

     // zero padding flag
     always @(*) begin
          if(done & ready_i) begin
               // pad_flag = ((8 > zrl_cnt) & (mode == 2'b10)) | (( 8 > bpc_cnt) & (mode == 2'b11));
               pad_flag = ((8 > zrl_cnt) | ( 8 > bpc_cnt));
          
          end  // mode check + zero padding(bcnt(max block 수 = 8) >= zrl_cnt(compressed block 수))
          else if(done & !ready_i) begin
               pad_flag = pad_flag;
          end
          else begin
               pad_flag    = 0;
          end 
     end


     // data block 갯수 cnt
     always @(*) begin                    
          if(done & ready_i) begin
               if(bcnt == 0) begin       // sop_o 뜰 때(bcnt = 0) size check 를 통한 data block 갯수 cnt 
                    zrl_cnt = zrl_fifo_s_out [9:6] + (|zrl_fifo_s_out [5:0]);        // 3bit + 0 or 1 (0 ~ 8 block)
                    if(zrl_cnt > 8) zrl_cnt = 8;
               end
               if(bcnt == 0) begin
                    bpc_cnt = bpc_fifo_s_out [9:6] + (|bpc_fifo_s_out [5:0]);
                    if(bpc_cnt > 8) bpc_cnt = 8;
               end
          end
          else if (done & !ready_i) begin      // !ready_i
               zrl_cnt = zrl_cnt;
               bpc_cnt = bpc_cnt;
          end
          else begin
               zrl_cnt = 0;
               bpc_cnt = 0;
          end
     end

     // data_rd (case 1 + case 2) ------------------------------ 22.07.25 수정 해야함. 원노트 참고하기.!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

     // pad_data
     always @(*) begin
          if(done & ready_i) begin
               if(pad_flag & mode == 2'b10) begin      // bpc pad_flag 인 경우 나머지 정상 출력 (쓰레기값 방출)
                    pad_data = ~(bcnt < zrl_cnt);
               end
               else if(pad_flag & mode == 2'b11) begin      // bpc pad_flag 인 경우 나머지 정상 출력 (쓰레기값 방출)
                    pad_data = ~(bcnt < bpc_cnt);
               end
               else begin                                   // !pad_flag(8burst 모두 나오는 case) 인 경우.
                    pad_data = 0;
               end
               // flush의 경우 data_rd를 통해 write 하는 것을 버려야함.
          end
     end

     // bpc_rd
     always @(*) begin
          if(done & ready_i) begin
               // bpc 실패 case 1 - pad_flag 이고 zrl 출력시
               if(pad_flag & (8 > zrl_cnt) & (mode == 2'b10)) begin      // zrl pad_flag 인 경우 나머지 정상 출력 (쓰레기값 방출)
                    data_rd_bpc_r = 1;                      // 방출
               end
               else if(pad_flag & pad_data) begin           // zero padding 기간동안 timing delay ?
                    data_rd_bpc_r = 0;
               end
               // bpc 실패 case 2 - 압축 x
               else if (bpc_fifo_s_out > 512 & !(mode ==2'b11)) begin // bpc 압축 실패
                    data_rd_bpc_r = 1;
               end
               else begin                                   
                    // 정상 출력
                    data_rd_bpc_r = (bcnt < bpc_cnt);
               end
          end
          else begin                      // !ready_i 포함
               data_rd_bpc_r     = 0;
          end
     end

     // zrl_rd
     always @(*) begin
          if(done & ready_i) begin
               // zrl 실패 case 1 - pad_flag 이고 bpc 출력시
               if(pad_flag & (8 > bpc_cnt) & (mode == 2'b11)) begin      // bpc pad_flag 인 경우 나머지 정상 출력 (쓰레기값 방출)
                    data_rd_zrl_r = 1;                      // 방출
               end
               else if(pad_flag & pad_data) begin           // zero padding 기간동안 data_rd_zrl_r = 0으로 timing delay 필요..?
                    data_rd_zrl_r = 0;
               end
               // zrl 실패 case 2 - 압축 x
               else if (zrl_fifo_s_out > 512 & !(mode ==2'b10)) begin // zrl 압축 실패
                    data_rd_zrl_r = 1;
               end
               else begin                                   
                    // 정상 출력
                    data_rd_zrl_r = (bcnt < zrl_cnt);
               end
          end
          else begin                      // !ready_i 포함
               data_rd_zrl_r     = 0;
          end
     end

     // sr_rd
     always @(*) begin
          if(done & ready_i) begin
               data_rd_sr_r        = 1;
          end
          else begin                      
               data_rd_sr_r        = 0;
          end
     end


     
     
     
/*     
     always @(*) begin
          if(done & ready_i) begin
               // 정상 출력
               data_rd_bpc_r = (bcnt < bpc_cnt);
               data_rd_zrl_r = (bcnt < zrl_cnt);
               data_rd_sr_r  = 1;
               if(pad_flag & mode == 2'b10) begin           // zrl pad_flag 인 경우 나머지 정상 출력 (쓰레기값 방출)
                    pad_data = ~(bcnt < zrl_cnt);
                    data_rd_bpc_r = 1;                      // 방출
               end
               else if(pad_flag & mode == 2'b11) begin      // bpc pad_flag 인 경우 나머지 정상 출력 (쓰레기값 방출)
                    pad_data = ~(bcnt < bpc_cnt);
                    data_rd_zrl_r = 1;                      // 방출
               end
               else if (bpc_fifo_s_out > 512 & !(mode ==2'b11)) begin // bpc 압축 실패
                    data_rd_bpc_r = 1;
               end
               else if (zrl_fifo_s_out > 512 & !(mode ==2'b10)) begin // zrl 압축 실패
                    data_rd_bpc_r = 1;
               end
               else if (sr_fifo_s_out == 1 & !(mode ==2'b01)) begin // sr 압축 실패
                    data_rd_bpc_r = 1;
               end
               else if ((bpc_fifo_s_out > 512) && (zrl_fifo_s_out > 512) && (sr_fifo_s_out == 1)) begin      // 셋다 압축 안되는 경우.
                    data_rd_zrl_r = 1;
                    // data_rd_sr_r  = 1; (위와 동일)
               end
               else begin                                   // !pad_flag(8burst 모두 나오는 case) 인 경우.
                    pad_data = 0;
               end
               // flush의 경우 data_rd를 통해 write 하는 것을 버려야함.
          end
          else begin                      // !ready_i 포함
              data_rd_bpc_r     = 0;
              data_rd_zrl_r     = 0;
              data_rd_sr_r      = 0;
          end
     end
*/

// -------------------------------------------------------------------------------------------------------------------------------------------

     // mode             : 값을 설정할 때 기존 값이 X가 되도록 해야하는지. (질문!!)

     // ok_flag
     assign ok_flag [2] = (sr_fifo_s_out == 0) ? 1'b1 : 1'b0;
     assign ok_flag [1] = (zrl_fifo_s_out <= 512) ? 1'b1 : 1'b0;
     assign ok_flag [0] = (bpc_fifo_s_out <= 512) ? 1'b1 : 1'b0;
     // fifo_size_out을 wr_i, rd_i로 변경하기.
     // rst_n 일때 ok_flag 0으로 초기화.

     // mode
     assign mode = (ok_flag == 3'b111) ? 2'b01 :        // sr
                   (ok_flag == 3'b110) ? 2'b01 :
                   (ok_flag == 3'b101) ? 2'b01 :
                   (ok_flag == 3'b100) ? 2'b01 :
                   (ok_flag == 3'b011) ? 2'b10 :        // zrl
                   (ok_flag == 3'b010) ? 2'b10 :
                   (ok_flag == 3'b001) ? 2'b11 :        // bpc
                   (ok_flag == 3'b000) ? 2'b11 : 2'b00; // 모두 실패시 bpc로 진(모두 실패 == block 수가 8보다 크면)
     // mode가 rst_n에 적용되기 위해 ok_flag가 rst_n에 적용되도록 할 것.





    // empty
    assign empty_flag = (sr_fifo_s_empty & zrl_fifo_s_empty & bpc_fifo_s_empty);




     // -----------output-------------

     // mc_valid_o       : ________________________________------------------------------------------------------------------_____________------------------____________-------------------
     // mc_ready_i       : __----____----____----____----____----____----____----____----____----____----____----____----____----____----____----____
     // sop_o            :   --------Engine cycle--------  |_--------________________________________________________________________________________________--------______ 
     // eop_o            :   --------Engine cycle--------  |_________________________________________________________--------_______________________________________
     // addr_o           :   --------Engine cycle--------  | 0       | 1     | 2     | 3     | 4     | 5     | 6     | 7     | ---------- |          
     // data_o           :   --------Engine cycle--------  |D0       |D1     |D2     |D3     |D4     |D5     |D6     |D7     | ---------- |

     
     /* output signal*/
     // !empty_flag & ready_i & !valid_i 일 때 1이되도록 하기.

     // almost_full
     assign almost_full_flag = (sr_fifo_s_th|zrl_fifo_s_th|bpc_fifo_s_th);  // wr_i, rd_i로 표현하기. 현재 7block 이상이면, 즉 wr_i - rd_i = 7이면 1
     // ready_o
     assign sr_ready_in = ready_i & (~sr_fifo_d_full);
     assign zrl_ready_in = ready_i & (~zrl_fifo_d_full);
     assign bpc_ready_in = ready_i & (~bpc_fifo_d_full);
     
     assign ready_o = sr_ready_in & zrl_ready_in & bpc_ready_in & !almost_full_flag;


     assign sop_o = sop_out;        
     assign eop_o = eop_out;
     assign data_o = (done == 1'b0) ? 'b0 : 
                     (pad_flag & pad_data)  ? 'b0 : 
                     (mode == 2'b01) ? sr_fifo_d_out : 
                     (mode == 2'b10) ? zrl_fifo_d_out : 
                     (mode == 2'b11) ? bpc_fifo_d_out : 'b0;
     // !ready_i & done 일 때, hold시키기.

     assign valid_o = (done | pad_flag);

     // sop_o,eop_o
     always @(*) begin
          if(done & ready_i) begin
              sop_out     = (bcnt == 0);
              eop_out     = (bcnt == 7);     // 1 cycle
          end
          else begin
              sop_out     = 0;
              eop_out     = 0;
          end
     end
     // !ready_i & done 일 때 hold 되도록하기.

endmodule

