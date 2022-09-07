`define DRIV_IF_RD vif_rd.DRIVER_RD.driver_cb_rd

class rddriver;    // rd

    int no_transactions;

    virtual AXI_R_INTF vif_rd;

    mailbox wdmon2rddriv;

    function new(virtual AXI_R_INTF vif_rd,  mailbox wdmon2rddriv);
        this.vif_rd         = vif_rd;
        this.wdmon2rddriv     = wdmon2rddriv;
    endfunction

    task reset;
        wait (!vif_rd.rst_n);    // #5;
        $display("[ DRIVER ] ----- Reset Started ----- ");

        `DRIV_IF_RD.rlast        <= 0;    // ri
        `DRIV_IF_RD.rvalid        <= 0;
        `DRIV_IF_RD.rdata        <= 0;

        wait (vif_rd.rst_n);    // #5;
        $display("[ DRIVER ] ----- Reset Ended -----");
    endtask
    
    task run;
        transaction trans;

        forever begin
            int cycle2cycle_delay = 0;
            int trans2trans_delay = 0;

            wdmon2rddriv.get(trans);    
            for (int i=0; i<8; i=i+1) begin
                // drive data. The data will not change until it is received by ready.
                `DRIV_IF_RD.rvalid        <= trans.valid;
                `DRIV_IF_RD.rlast        <= (i==7);
                `DRIV_IF_RD.rdata        <= trans.data[i];
            //    $display($time," cnt : %0d data = %h", i, trans.data[i]);
                @(posedge vif_rd.clk);
                while (!`DRIV_IF_RD.rready) begin
                    @(posedge vif_rd.clk);
                end
                `DRIV_IF_RD.rvalid        <= 1'b0;
                `DRIV_IF_RD.rlast         <= 1'bx;
                `DRIV_IF_RD.rdata         <= 'hx;
                //int delay = $urandom()%10;
                repeat(cycle2cycle_delay) @(posedge vif_rd.clk);
            end
            `DRIV_IF_RD.rvalid        <= 1'b0;
            `DRIV_IF_RD.rlast         <= 1'bx;
            `DRIV_IF_RD.rdata         <= 'hx;
            no_transactions++;
            //int delay = $urandom()%10;
            repeat(trans2trans_delay) @(posedge vif_rd.clk);
        end
    endtask

endclass

