module BPC_COMP
(
    input   wire  [63:0] 	data_i,
    input   wire              valid_i,
    input   wire  			sop_i,
    input   wire			eop_i,
    input   wire              rst_n,
    input   wire              clk,

    output  wire   [151:0] 	data_o,
    output  wire   [7:0]		size_o,
    output  wire			sop_o,
    output  wire 			eop_o,
    output  wire			valid_o
);

    reg		[15:0]		delta [0:62];
    reg		[15:0]		baseword_1;
    reg		[3:0]		bcnt_1, bcnt_1_n;

    reg 					valid_mid, valid_mid_n;
    reg 		[62:0]         mid_buf [0:15];
    reg        [62:0]         mid_buf_n [0:15];
    reg		[15:0]		baseword_buf, baseword_buf_n;
    reg					stage_2, stage_2_n;

    reg		[62:0]		dbp [0:15];
    reg		[62:0]		dbx [0:15];
    reg		[15:0]		baseword_2;
    reg		[3:0]		bcnt_2, bcnt_2_n;
    reg		[62:0]		de_input_1, de_input_2;
    reg					de_flag_1, de_flag_2;
    wire					de_zero_1, de_zero_2;
    wire		[63:0]		de_output_1, de_output_2;
    wire		[6:0]		de_size_1, de_size_2;
    reg		[4:0]		len_cnt, len_cnt_n;
    reg		[3:0]		send_cnt, send_cnt_n;

    reg		[151:0]		data_out, data_out_n;
    reg		[7:0]		size_out, size_out_n;
    reg					sop_out, sop_out_n;
    reg					eop_out, eop_out_n;
    reg					valid_out, valid_out_n;

    integer i;
    integer j;

    BPC_DBX_ENC DE0
    (
        .dbx_i		(de_input_1),
	.dbp_flag_i	(de_flag_1),

	.zeroflag_o	(de_zero_1),
	.codeword_o	(de_output_1),
	.size_o		(de_size_1)
    );
    BPC_DBX_ENC DE1
    (
	.dbx_i		(de_input_2),
	.dbp_flag_i	(de_flag_2),

	.zeroflag_o	(de_zero_2),
	.codeword_o	(de_output_2),
	.size_o		(de_size_2)
    );
    
    // stage 1 (delta, bp)
    always @(*) begin
	bcnt_1_n = bcnt_1;
	valid_mid_n = 0;
	if (valid_i) begin											// 22.07.19
     	if (sop_i) begin
			bcnt_1 = 0;					// 22.07.05
			baseword_1 = data_i[63:48];
	    	end 
		else begin
			delta[(bcnt_1*4)-1] = data_i[63:48] - baseword_1;	
		end
			delta[bcnt_1*4] = data_i[47:32] - baseword_1; 
			delta[(bcnt_1*4)+1] = data_i[31:16] - baseword_1;
			delta[(bcnt_1*4)+2] = data_i[15:0] - baseword_1;

		
		bcnt_1_n = bcnt_1 + 1;
		if (eop_i) begin
			// delta, baseword toss
			// delta, baseword initialize
			for (i = 0; i < 63; i = i + 1) begin
				for (j = 0; j < 16; j = j + 1) begin
					mid_buf_n[15-j][62-i] = delta[i][j];
				end
			end
			baseword_buf_n = baseword_1;
			valid_mid_n = 1;
		end
     end
    end

    // stage 2 (dbp, dbx, encode)
    always @(*) begin
	bcnt_2_n = bcnt_2;
	len_cnt_n = len_cnt;
	send_cnt_n = send_cnt;
	stage_2_n = stage_2;
	sop_out_n = 0;
	eop_out_n = 0;
	valid_out_n = 0;
	data_out_n = 'b0;
	size_out_n = 0;
	if (valid_mid) begin
        for (i = 0; i < 16; i = i + 1) begin
	        dbp[i] = mid_buf[i];
	    end
	    baseword_2 = baseword_buf;
	    for (i = 1; i < 16; i = i + 1) begin
		dbx[i] = dbp[i-1] ^ dbp[i];
	    end
	    dbx[0] = dbp[0];
	    len_cnt_n = 0;
	    bcnt_2_n = 0;
	    stage_2_n = 1;
        end
	if (stage_2) begin														// 22.07.19
	    // encode dbx_n[bcnt_2*2], dbx_n[(bcnt_2*2)+1]
	    // concatenate two, if bcnt_2 == 0 then 2'b00 and baseword too
	    
	        de_input_1 = dbx[bcnt_2*2];
	        de_input_2 = dbx[(bcnt_2*2)+1];
	        de_flag_1 = ~(| dbp[bcnt_2*2]);
	        de_flag_2 = ~(| dbp[(bcnt_2*2)+1]);
	    
	    
	        size_out_n = de_size_1 + de_size_2;
            	case ({de_zero_1, de_zero_2})
		    2'b11 : begin
		        if (bcnt_2 == 7) begin
		            data_out_n = {2'b01, len_cnt_n[3:0], 146'b0};
			        size_out_n = 6;
			        valid_out_n = 1;
		        end 
                else begin
		 	        len_cnt_n = len_cnt_n + 2;
			        valid_out_n = 0;
	            end
	        end
		    2'b10 : begin
	                if (len_cnt_n == 0) begin
			    data_out_n = {3'b001, de_output_2, 85'b0};
			    size_out_n = size_out_n + 3;
		        end else begin
			    len_cnt_n = len_cnt_n - 1;
			    data_out_n = {2'b01, len_cnt_n[3:0], de_output_2, 82'b0};
			    size_out_n = size_out_n + 6;
		        end
		        len_cnt_n = 0;
		        valid_out_n = 1;
	            end
		    2'b01 : begin
		        if (len_cnt_n == 0) begin
			    data_out_n = {de_output_1, 88'b0};
		        end else if (len_cnt_n == 1) begin
			    data_out_n = {3'b001, de_output_1, 85'b0};
			    size_out_n = size_out_n + 3;
		        end else begin
			    len_cnt_n = len_cnt_n - 2;
			    data_out_n = {2'b01, len_cnt_n[3:0], de_output_1, 82'b0};
			    size_out_n = size_out_n + 6;
	                end
		        len_cnt_n = 1;
		        valid_out_n = 1;
		        if (bcnt_2 == 7) begin
			    data_out_n = data_out_n | ({3'b001} << (149 - size_out_n));
			    size_out_n = size_out_n + 3;
		        end
	            end
		    2'b00 : begin
		        if (len_cnt_n == 0) begin
			    data_out_n = {de_output_1, 88'b0};
			    data_out_n = data_out_n | (de_output_2 << (88 - de_size_1));
		        end else if (len_cnt_n == 1) begin
			    data_out_n = {3'b001, de_output_1, 85'b0};
			    data_out_n = data_out_n | (de_output_2 << (85 - de_size_1));
			    size_out_n = size_out_n + 3;
		        end else begin
			    len_cnt_n = len_cnt_n - 2;
			    data_out_n = {2'b01, len_cnt_n[3:0], de_output_1, 82'b0};
			    data_out_n = data_out_n | (de_output_2 << (82 - de_size_1));
		            size_out_n = size_out_n + 6;
		        end
		        len_cnt_n = 0;
		        valid_out_n = 1;
		    end
                endcase
	        if (valid_out_n) begin
		    send_cnt_n = send_cnt + 1;
		    if (send_cnt == 0) begin
	                sop_out_n = 1;
		        data_out_n = {2'b00, baseword_2, data_out_n[151:18]};
			size_out_n = size_out_n + 18;
	            end
		    if (bcnt_2 == 7) begin
	                eop_out_n = 1;
		        len_cnt_n = 0;
		        send_cnt_n = 0;
		        stage_2_n = 0;
	            end
	        end
	    
	    bcnt_2_n = bcnt_2 + 1;
	    if (bcnt_2 == 7) begin
		bcnt_2_n = 0;
		send_cnt_n = 0;
	    end
	end
    end
  
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
	    for (i = 0; i < 16; i = i + 1) begin
	        mid_buf[i] <= 'b0;
	    end
	    baseword_buf <= 'b0;
	    bcnt_1 <= 'b0;
	    valid_mid <= 'b0;
	    bcnt_2 <= 'b0;
	    len_cnt <= 'b0;
	    send_cnt <= 'b0;
	    data_out <= 'b0;
	    size_out <= 'b0;
	    sop_out <= 'b0;
	    eop_out <= 'b0;
	    valid_out <= 'b0;
	    stage_2 <= 'b0;
        end else begin
	    for (i = 0; i < 16; i = i + 1) begin
	        mid_buf[i] <= mid_buf_n[i];
	    end
	    baseword_buf <= baseword_buf_n;
	    bcnt_1 <= bcnt_1_n;
	    valid_mid <= valid_mid_n;
	    bcnt_2 <= bcnt_2_n;
	    len_cnt <= len_cnt_n;
	    send_cnt <= send_cnt_n;
	    data_out <= data_out_n;
	    size_out <= size_out_n;
	    sop_out <= sop_out_n;
	    eop_out <= eop_out_n;
	    valid_out <= valid_out_n;
	    stage_2 <= stage_2_n;
        end
    end

    assign data_o = data_out;
    assign size_o = size_out;
    assign sop_o = sop_out;
    assign eop_o = eop_out;
    assign valid_o = valid_out;
 
endmodule
