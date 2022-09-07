module SOP_GEN (
    input   wire                clk,
    input   wire                rst_n,

    input   wire                valid_i,
    input   wire                ready_i,
    input   wire                last_i,
    output  wire                sop_o
);

    reg                         flag;

    always @(posedge clk) begin
        if(!rst_n) begin
            flag                <= 1'b1;
        end
        else if(valid_i & ready_i) begin
            if (last_i)
                flag                <= 1'b1;
            else
                flag                <= 1'b0;
        end
    end

    assign  sop_o               = flag & valid_i;

endmodule
