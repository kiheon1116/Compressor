module ZRL_CODEBUF
(
    input wire [67:0]           data_i,
    input wire [6:0]         size_i,
    input wire             valid_i,
    input wire              ready_i,        // 22.09.07 kkh
    input wire            sop_i,    
    input wire             eop_i,
    input wire                      rst_n,
    input wire            clk,
    
    output wire [63:0]         data_o,
    output wire [10:0]        size_o,
    output wire             d_valid,
    output wire            s_valid
);


    reg [63:0]             data_out, data_out_n;
    reg [10:0]             size_out, size_out_n;
    reg [143:0]             code_buf, code_buf_n;
    reg [7:0]             buf_size, buf_size_n;
    reg [10:0]            total_size, total_size_n;
    reg                    data_valid, data_valid_n;
    reg                      size_valid, size_valid_n;
    reg [3:0]                bcnt, bcnt_n;
    reg                    eop_mid;

    reg 				flush, flush_n;
    reg [3:0]                    count;



    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            data_out <= 'b0;
            size_out <= 'b0;
            code_buf <= 'b0;
            buf_size <= 'b0;
            total_size <= 'b0;
            data_valid <= 'b0;
            size_valid <= 'b0;
            bcnt <= 'b0;
		  flush <= 'b0;
        end
        else begin
            data_out <= data_out_n;
            size_out <= size_out_n;
            code_buf <= code_buf_n;
            buf_size <= buf_size_n;
            total_size <= total_size_n;
            data_valid <= data_valid_n;
            size_valid <= size_valid_n;
            bcnt <= bcnt_n;
		  flush <= flush_n;
        end
    end

	/////////////////////////////////////////////////////////
	// Timing diagram
	/////////////////////////////////////////////////////////

	// case 1 : 8 burst 연속 정상 출력 되는 경우. (buffer에 data가 남아 있지 않음.)

	// clk              : --__--__--__--__--__--__--__--__--__--__--__--__--__--__--__--__--__--__--__--__--__--__--__--__--__
	// buf_size_n		: --- |64 |64 |64 |64 |64 |64 |64 |64 |64 |
	// buf_size		    : 
	// bcnt			    :  x  | 0 | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 |
  	// bcnt_n			:  0  | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 0 |

	// data_valid_n 	: ____--------------------------------__________
	// data_o			: 	  |D1 |D2 |D3 |D4 |D5 |D6 |D7 |D8 |
	// size_valid_n	    : ________________________________----___________
	// size_o			: ________________________________|siz|__________ 

	// case 2 : 0~7 burst 만 출력되는 경우. (buffer에 data가 남아 있음.)

	// clk              : --__--__--__--__--__--__--__--__--__--__--__--__--__--__--__--__--__--__--__--__--__--__--__--__--__
	// buf_size_n		: --- |64 |64 |64 |64 |64 |
	// buf_size		    : 
	// bcnt			    :  x | 0 | 1 | 2 | 3 | 4 | 5 | 0 | 1 | 2 | 3 | 4 | 5 ----
  	// bcnt_n			:  0 | 1 | 2 | 3 | 4 | 5 | 0 | 1 | 2 | 3 | 4 | 5 | -----

	// data_valid_n 	: ___--------------------______________________
	// data_o			: 	 |D1 |D2 |D3 |D4 |D5 |pd |pd |pd |
	// pad_flag 		: _____________________________________-------------------
	// size_valid_n	    : _______________________________----___________
	// size_o			: _______________________________|siz|__________ (size < 512)

	// case 3 : 8 burst를 초과하여 size > 512 되어 압축 x 경우. (buffer에 data가 남아 있음.)

	// clk              : --__--__--__--__--__--__--__--__--__--__--__--__--__--__--__--__--__--__--__--__--__--__--__--__--__
	// buf_size_n		: --- |64 |64 |64 |64 |64 |64 |64 |64 |64 |64 |64 |64 | 
	// buf_size		    : 
	// bcnt			    :  x  | 0 | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 0 |
  	// bcnt_n			:  0  | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 0 |

	// flush			: ________________________________________-----------  ??
	// flush_n			: ____________________________________-----------      ??

	// data_valid_n 	: ____---------------------------------__________
	// data_o			: 	  |D1 |D2 |D3 |D4 |D5 |D6 |D7 |D8 |
	// size_valid_n	    : _______________________________----___________
	// size_o			: _______________________________|513|__________

	

    always @(*) begin
        buf_size_n = buf_size;
        total_size_n = total_size;
        code_buf_n = code_buf;
        bcnt_n = bcnt;
        data_valid_n = 1'b0;
        size_valid_n = 1'b0;
        data_out_n = 'b0;
        size_out_n = 'b0;
        //eop_mid = 1'b0;
        
        
        if (valid_i) begin
            code_buf_n = code_buf | (data_i << (76 - buf_size));
            buf_size_n = buf_size + size_i;
            total_size_n = total_size + size_i;
            
            eop_mid = (eop_i);
        end
        if ((buf_size_n >= 64)) begin	        
            if (bcnt != 8) begin				// bcnt가 8이 아니면, 즉 bcnt 0 ~ 7 즉 8번 미만 출력완료의 경우. - case 2
                data_valid_n = 1'b1;
                data_out_n = code_buf_n[143:80];
                code_buf_n = code_buf_n << 64;
                buf_size_n = buf_size_n - 64;
                bcnt_n = bcnt + 1;                    
            end 
		  else begin							// bcnt가 8인 경우. (즉 이미 8번 출력완료한 경우. - case 1 , case 3) 
                code_buf_n = 'b0;
                // buf_size_n = 0;		
                flush_n = 1;                    // bcnt == 8인 상태로 유지. + 압축 실패 flag = flush
		  end
        end
        if (eop_mid) begin
            if (buf_size_n != 0) begin          // data가 남아있다면,(case 2 + case 3)
                if (bcnt_n == 8) begin          // case 3 : data 8번 출력되었으므로 initialize
                    buf_size_n = 0;
                    code_buf_n = 'b0;
                    bcnt_n = 0;
                end else begin                  // case 2 : data 0~7번 출력되었으므로 마지막 데이터 출력.+ buf_size_n, bcnt_n, codebuf_n(자동 shift로 초기화됨) 초기화.
                    buf_size_n = 64;
                    bcnt_n = 15;
                end
            end 
            else begin                          // case 1
                bcnt_n = 0;
            end
            size_valid_n = 1'b1;
            if(size_valid_n & (count != 0)) size_valid_n = 1'b0;     // 22.09.07 kkh 

            if(flush_n) size_out_n = 513;       // case 3에 대한 size
            else size_out_n = total_size_n;     // case 1 , case 2 에 대한 size.
            total_size_n = 0;
            flush_n = 0;
	   end
    end

    always @(posedge clk) begin
        if(!rst_n) begin
            count <= 0;
        end
        else if(sop_i) begin
            count <= 0;
        end
        else if(size_valid_n) begin
            count <= count + 1;
        end
    end

    assign data_o = data_out;
    assign size_o = size_out;
    assign d_valid = data_valid;
    assign s_valid = size_valid;


endmodule