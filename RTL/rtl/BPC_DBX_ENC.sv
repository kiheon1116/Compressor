module BPC_DBX_ENC
(
    input wire	[62:0]		dbx_i,
    input wire			dbp_flag_i,

    output wire  		zeroflag_o,
    output wire [63:0]		codeword_o,
    output wire [6:0]		size_o
);

    reg				zeroflag_out;
    reg		[63:0]		codeword_out;
    reg		[6:0]		size_out;

    assign zeroflag_o = zeroflag_out;
    assign codeword_o = codeword_out;
    assign size_o = size_out;

    always @(*) begin
	    if ((| dbx_i) == 0) begin
		zeroflag_out = 1;
		codeword_out = 0;
		size_out = 0;
	    end else if ((& dbx_i) == 1) begin
		zeroflag_out = 0;
		codeword_out = {64'b0};
		size_out = 5;
	    end else if (dbp_flag_i) begin
		zeroflag_out = 0;
		codeword_out = {5'b00001, 59'b0};
		size_out = 5;
	    end else begin
		zeroflag_out = 0;
		size_out = 11;
		case (dbx_i)
		    {61'b0, 2'b11} : codeword_out = {5'b00010, 6'b000000, 53'b0}; //consec start
                    {60'b0, 2'b11, 1'b0} : codeword_out = {5'b00010, 6'b000001, 53'b0};
		    {59'b0, 2'b11, 2'b0} : codeword_out = {5'b00010, 6'b000010, 53'b0};
		    {58'b0, 2'b11, 3'b0} : codeword_out = {5'b00010, 6'b000011, 53'b0};
		    {57'b0, 2'b11, 4'b0} : codeword_out = {5'b00010, 6'b000100, 53'b0};
		    {56'b0, 2'b11, 5'b0} : codeword_out = {5'b00010, 6'b000101, 53'b0};
		    {55'b0, 2'b11, 6'b0} : codeword_out = {5'b00010, 6'b000110, 53'b0};
		    {54'b0, 2'b11, 7'b0} : codeword_out = {5'b00010, 6'b000111, 53'b0};
		    {53'b0, 2'b11, 8'b0} : codeword_out = {5'b00010, 6'b001000, 53'b0};
		    {52'b0, 2'b11, 9'b0} : codeword_out = {5'b00010, 6'b001001, 53'b0};
		    {51'b0, 2'b11, 10'b0} : codeword_out = {5'b00010, 6'b001010, 53'b0};
		    {50'b0, 2'b11, 11'b0} : codeword_out = {5'b00010, 6'b001011, 53'b0};
		    {49'b0, 2'b11, 12'b0} : codeword_out = {5'b00010, 6'b001100, 53'b0};
		    {48'b0, 2'b11, 13'b0} : codeword_out = {5'b00010, 6'b001101, 53'b0};
		    {47'b0, 2'b11, 14'b0} : codeword_out = {5'b00010, 6'b001110, 53'b0};
		    {46'b0, 2'b11, 15'b0} : codeword_out = {5'b00010, 6'b001111, 53'b0};
		    {45'b0, 2'b11, 16'b0} : codeword_out = {5'b00010, 6'b010000, 53'b0};
		    {44'b0, 2'b11, 17'b0} : codeword_out = {5'b00010, 6'b010001, 53'b0};
		    {43'b0, 2'b11, 18'b0} : codeword_out = {5'b00010, 6'b010010, 53'b0};
		    {42'b0, 2'b11, 19'b0} : codeword_out = {5'b00010, 6'b010011, 53'b0};
		    {41'b0, 2'b11, 20'b0} : codeword_out = {5'b00010, 6'b010100, 53'b0};
		    {40'b0, 2'b11, 21'b0} : codeword_out = {5'b00010, 6'b010101, 53'b0};
		    {39'b0, 2'b11, 22'b0} : codeword_out = {5'b00010, 6'b010110, 53'b0};
		    {38'b0, 2'b11, 23'b0} : codeword_out = {5'b00010, 6'b010111, 53'b0};
		    {37'b0, 2'b11, 24'b0} : codeword_out = {5'b00010, 6'b011000, 53'b0};
		    {36'b0, 2'b11, 25'b0} : codeword_out = {5'b00010, 6'b011001, 53'b0};
		    {35'b0, 2'b11, 26'b0} : codeword_out = {5'b00010, 6'b011010, 53'b0};
		    {34'b0, 2'b11, 27'b0} : codeword_out = {5'b00010, 6'b011011, 53'b0};
		    {33'b0, 2'b11, 28'b0} : codeword_out = {5'b00010, 6'b011100, 53'b0};
		    {32'b0, 2'b11, 29'b0} : codeword_out = {5'b00010, 6'b011101, 53'b0};
		    {31'b0, 2'b11, 30'b0} : codeword_out = {5'b00010, 6'b011110, 53'b0};
		    {30'b0, 2'b11, 31'b0} : codeword_out = {5'b00010, 6'b011111, 53'b0};
		    {29'b0, 2'b11, 32'b0} : codeword_out = {5'b00010, 6'b100000, 53'b0};
		    {28'b0, 2'b11, 33'b0} : codeword_out = {5'b00010, 6'b100001, 53'b0};
		    {27'b0, 2'b11, 34'b0} : codeword_out = {5'b00010, 6'b100010, 53'b0};
		    {26'b0, 2'b11, 35'b0} : codeword_out = {5'b00010, 6'b100011, 53'b0};
		    {25'b0, 2'b11, 36'b0} : codeword_out = {5'b00010, 6'b100100, 53'b0};
		    {24'b0, 2'b11, 37'b0} : codeword_out = {5'b00010, 6'b100101, 53'b0};
		    {23'b0, 2'b11, 38'b0} : codeword_out = {5'b00010, 6'b100110, 53'b0};
		    {22'b0, 2'b11, 39'b0} : codeword_out = {5'b00010, 6'b100111, 53'b0};
		    {21'b0, 2'b11, 40'b0} : codeword_out = {5'b00010, 6'b101000, 53'b0};
		    {20'b0, 2'b11, 41'b0} : codeword_out = {5'b00010, 6'b101001, 53'b0};
		    {19'b0, 2'b11, 42'b0} : codeword_out = {5'b00010, 6'b101010, 53'b0};
		    {18'b0, 2'b11, 43'b0} : codeword_out = {5'b00010, 6'b101011, 53'b0};
		    {17'b0, 2'b11, 44'b0} : codeword_out = {5'b00010, 6'b101100, 53'b0};
		    {16'b0, 2'b11, 45'b0} : codeword_out = {5'b00010, 6'b101101, 53'b0};
		    {15'b0, 2'b11, 46'b0} : codeword_out = {5'b00010, 6'b101110, 53'b0};
		    {14'b0, 2'b11, 47'b0} : codeword_out = {5'b00010, 6'b101111, 53'b0};
		    {13'b0, 2'b11, 48'b0} : codeword_out = {5'b00010, 6'b110000, 53'b0};
		    {12'b0, 2'b11, 49'b0} : codeword_out = {5'b00010, 6'b110001, 53'b0};
		    {11'b0, 2'b11, 50'b0} : codeword_out = {5'b00010, 6'b110010, 53'b0};
		    {10'b0, 2'b11, 51'b0} : codeword_out = {5'b00010, 6'b110011, 53'b0};
		    {9'b0, 2'b11, 52'b0} : codeword_out = {5'b00010, 6'b110100, 53'b0};
		    {8'b0, 2'b11, 53'b0} : codeword_out = {5'b00010, 6'b110101, 53'b0};
		    {7'b0, 2'b11, 54'b0} : codeword_out = {5'b00010, 6'b110110, 53'b0};
		    {6'b0, 2'b11, 55'b0} : codeword_out = {5'b00010, 6'b110111, 53'b0};
		    {5'b0, 2'b11, 56'b0} : codeword_out = {5'b00010, 6'b111000, 53'b0};
		    {4'b0, 2'b11, 57'b0} : codeword_out = {5'b00010, 6'b111001, 53'b0};
		    {3'b0, 2'b11, 58'b0} : codeword_out = {5'b00010, 6'b111010, 53'b0};
		    {2'b0, 2'b11, 59'b0} : codeword_out = {5'b00010, 6'b111011, 53'b0};
		    {1'b0, 2'b11, 60'b0} : codeword_out = {5'b00010, 6'b111100, 53'b0};
		    {2'b11, 61'b0} : codeword_out = {5'b00010, 6'b111101, 53'b0}; //consec end
		    {62'b0, 1'b1} : codeword_out = {5'b00011, 6'b000000, 53'b0}; //single start
		    {61'b0, 1'b1, 1'b0} : codeword_out = {5'b00011, 6'b000001, 53'b0};
		    {60'b0, 1'b1, 2'b0} : codeword_out = {5'b00011, 6'b000010, 53'b0};
		    {59'b0, 1'b1, 3'b0} : codeword_out = {5'b00011, 6'b000011, 53'b0};
		    {58'b0, 1'b1, 4'b0} : codeword_out = {5'b00011, 6'b000100, 53'b0};
		    {57'b0, 1'b1, 5'b0} : codeword_out = {5'b00011, 6'b000101, 53'b0};
		    {56'b0, 1'b1, 6'b0} : codeword_out = {5'b00011, 6'b000110, 53'b0};
		    {55'b0, 1'b1, 7'b0} : codeword_out = {5'b00011, 6'b000111, 53'b0};
		    {54'b0, 1'b1, 8'b0} : codeword_out = {5'b00011, 6'b001000, 53'b0};
		    {53'b0, 1'b1, 9'b0} : codeword_out = {5'b00011, 6'b001001, 53'b0};
		    {52'b0, 1'b1, 10'b0} : codeword_out = {5'b00011, 6'b001010, 53'b0};
		    {51'b0, 1'b1, 11'b0} : codeword_out = {5'b00011, 6'b001011, 53'b0};
		    {50'b0, 1'b1, 12'b0} : codeword_out = {5'b00011, 6'b001100, 53'b0};
		    {49'b0, 1'b1, 13'b0} : codeword_out = {5'b00011, 6'b001101, 53'b0};
		    {48'b0, 1'b1, 14'b0} : codeword_out = {5'b00011, 6'b001110, 53'b0};
		    {47'b0, 1'b1, 15'b0} : codeword_out = {5'b00011, 6'b001111, 53'b0};
		    {46'b0, 1'b1, 16'b0} : codeword_out = {5'b00011, 6'b010000, 53'b0};
		    {45'b0, 1'b1, 17'b0} : codeword_out = {5'b00011, 6'b010001, 53'b0};
		    {44'b0, 1'b1, 18'b0} : codeword_out = {5'b00011, 6'b010010, 53'b0};
		    {43'b0, 1'b1, 19'b0} : codeword_out = {5'b00011, 6'b010011, 53'b0};
		    {42'b0, 1'b1, 20'b0} : codeword_out = {5'b00011, 6'b010100, 53'b0};
		    {41'b0, 1'b1, 21'b0} : codeword_out = {5'b00011, 6'b010101, 53'b0};
		    {40'b0, 1'b1, 22'b0} : codeword_out = {5'b00011, 6'b010110, 53'b0};
		    {39'b0, 1'b1, 23'b0} : codeword_out = {5'b00011, 6'b010111, 53'b0};
		    {38'b0, 1'b1, 24'b0} : codeword_out = {5'b00011, 6'b011000, 53'b0};
		    {37'b0, 1'b1, 25'b0} : codeword_out = {5'b00011, 6'b011001, 53'b0};
		    {36'b0, 1'b1, 26'b0} : codeword_out = {5'b00011, 6'b011010, 53'b0};
		    {35'b0, 1'b1, 27'b0} : codeword_out = {5'b00011, 6'b011011, 53'b0};
		    {34'b0, 1'b1, 28'b0} : codeword_out = {5'b00011, 6'b011100, 53'b0};
		    {33'b0, 1'b1, 29'b0} : codeword_out = {5'b00011, 6'b011101, 53'b0};
		    {32'b0, 1'b1, 30'b0} : codeword_out = {5'b00011, 6'b011110, 53'b0};
		    {31'b0, 1'b1, 31'b0} : codeword_out = {5'b00011, 6'b011111, 53'b0};
		    {30'b0, 1'b1, 32'b0} : codeword_out = {5'b00011, 6'b100000, 53'b0};
		    {29'b0, 1'b1, 33'b0} : codeword_out = {5'b00011, 6'b100001, 53'b0};
		    {28'b0, 1'b1, 34'b0} : codeword_out = {5'b00011, 6'b100010, 53'b0};
		    {27'b0, 1'b1, 35'b0} : codeword_out = {5'b00011, 6'b100011, 53'b0};
		    {26'b0, 1'b1, 36'b0} : codeword_out = {5'b00011, 6'b100100, 53'b0};
		    {25'b0, 1'b1, 37'b0} : codeword_out = {5'b00011, 6'b100101, 53'b0};
		    {24'b0, 1'b1, 38'b0} : codeword_out = {5'b00011, 6'b100110, 53'b0};
		    {23'b0, 1'b1, 39'b0} : codeword_out = {5'b00011, 6'b100111, 53'b0};
		    {22'b0, 1'b1, 40'b0} : codeword_out = {5'b00011, 6'b101000, 53'b0};
		    {21'b0, 1'b1, 41'b0} : codeword_out = {5'b00011, 6'b101001, 53'b0};
		    {20'b0, 1'b1, 42'b0} : codeword_out = {5'b00011, 6'b101010, 53'b0};
		    {19'b0, 1'b1, 43'b0} : codeword_out = {5'b00011, 6'b101011, 53'b0};
		    {18'b0, 1'b1, 44'b0} : codeword_out = {5'b00011, 6'b101100, 53'b0};
		    {17'b0, 1'b1, 45'b0} : codeword_out = {5'b00011, 6'b101101, 53'b0};
		    {16'b0, 1'b1, 46'b0} : codeword_out = {5'b00011, 6'b101110, 53'b0};
		    {15'b0, 1'b1, 47'b0} : codeword_out = {5'b00011, 6'b101111, 53'b0};
		    {14'b0, 1'b1, 48'b0} : codeword_out = {5'b00011, 6'b110000, 53'b0};
		    {13'b0, 1'b1, 49'b0} : codeword_out = {5'b00011, 6'b110001, 53'b0};
		    {12'b0, 1'b1, 50'b0} : codeword_out = {5'b00011, 6'b110010, 53'b0};
		    {11'b0, 1'b1, 51'b0} : codeword_out = {5'b00011, 6'b110011, 53'b0};
		    {10'b0, 1'b1, 52'b0} : codeword_out = {5'b00011, 6'b110100, 53'b0};
		    {9'b0, 1'b1, 53'b0} : codeword_out = {5'b00011, 6'b110101, 53'b0};
		    {8'b0, 1'b1, 54'b0} : codeword_out = {5'b00011, 6'b110110, 53'b0};
		    {7'b0, 1'b1, 55'b0} : codeword_out = {5'b00011, 6'b110111, 53'b0};
		    {6'b0, 1'b1, 56'b0} : codeword_out = {5'b00011, 6'b111000, 53'b0};
		    {5'b0, 1'b1, 57'b0} : codeword_out = {5'b00011, 6'b111001, 53'b0};
		    {4'b0, 1'b1, 58'b0} : codeword_out = {5'b00011, 6'b111010, 53'b0};
		    {3'b0, 1'b1, 59'b0} : codeword_out = {5'b00011, 6'b111011, 53'b0};
		    {2'b0, 1'b1, 60'b0} : codeword_out = {5'b00011, 6'b111100, 53'b0};
		    {1'b0, 1'b1, 61'b0} : codeword_out = {5'b00011, 6'b111101, 53'b0};
		    {1'b1, 62'b0} : codeword_out = {5'b00011, 6'b111110, 53'b0}; // single end
		    default : begin
			codeword_out = {1'b1, dbx_i};
			size_out = 64;
		    end
	        endcase
	    end

    end

endmodule
