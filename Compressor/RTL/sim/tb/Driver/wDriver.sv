`define DRIV_IF_W vif_w.DRIVER_W.driver_cb_w
`define DRIV_IF_RD vif_rd.DRIVER_RD.driver_cb_rd
`define master vif_comp_flag_fifos.master.master_cb


class wdriver;    // w

    int no_transactions;
    logic comp_flag = 1'b1;

    virtual AXI_W_INTF vif_w;
    virtual AXI_R_INTF vif_rd;
    virtual STREAM_FIFOS_INTF vif_comp_flag_fifos;

    mailbox gen2driv;
    
    function new(virtual AXI_W_INTF vif_w, virtual STREAM_FIFOS_INTF vif_comp_flag_fifos, virtual AXI_R_INTF wif_rd, mailbox gen2driv);
        this.vif_w     = vif_w;
        this.vif_comp_flag_fifos = vif_comp_flag_fifos;
        this.vif_rd     = vif_rd;
        this.gen2driv     = gen2driv;
    endfunction

    task reset;
        wait (!vif_w.rst_n);    // #5;
        $display("[ DRIVER ] ----- Reset Started ----- ");

        `master.comp_flag        <= 0;      // 22.08.10
        `master.comp_flag_valid  <= 0;      // 22.08.10

        `DRIV_IF_W.wlast         <= 0;    // wi
        `DRIV_IF_W.wvalid        <= 0;    
        `DRIV_IF_W.wdata         <= 0;    
        
        wait (vif_w.rst_n);    // #5;
        $display("[ DRIVER ] ----- Reset Ended -----");
    endtask

    task run;    
        transaction trans;

        forever begin
            int cycle2cycle_delay = 0;
            int trans2trans_delay = 0;
            int rt = gen2driv.num();
            gen2driv.get(trans);
            for (int i=0; i<16; i=i+1) begin
                // drive data. The data will not change until it is received by ready.
                
                `master.comp_flag               <= trans.comp_flag;                     // 22.08.10
                `master.comp_flag_valid         <= 1;                               // 22.08.10

                `DRIV_IF_W.wvalid               <= trans.valid;
                `DRIV_IF_W.wlast                <= (i==15);
                `DRIV_IF_W.wdata                <= trans.data[i];
                //      $display($time," cnt : %0d data = %h", i, trans.data[i]);
                @(posedge vif_w.clk);
                while (!`DRIV_IF_W.wready) begin
                    @(posedge vif_w.clk);
                end

                `master.comp_flag               <= 1'bx;                     // 22.08.10
                `master.comp_flag_valid         <= 1'b0;                     // 22.08.10

                `DRIV_IF_W.wvalid               <= 1'b0;
                `DRIV_IF_W.wlast                <= 1'bx;
                `DRIV_IF_W.wdata                <= 'hx;
                //int delay = $urandom()%10;
                repeat(cycle2cycle_delay) @(posedge vif_w.clk);
            end
            
            `master.comp_flag               <= 1'bx;                     // 22.08.10
            `master.comp_flag_valid         <= 1'b0;                     // 22.08.10

            `DRIV_IF_W.wvalid               <= 1'b0;
            `DRIV_IF_W.wlast                <= 1'bx;
            `DRIV_IF_W.wdata                <= 'hx;
            comp_flag += 1;
            no_transactions++;
            //int delay = $urandom()%10;
            repeat(trans2trans_delay) @(posedge vif_w.clk);
        end
    endtask
endclass


        //    `DRIV_IF_W.valid    <= 1'b0;
        //    `DRIV_IF_W.last     <= 1'bx;
        //    `DRIV_IF_W.data     <= 'hx;
            //int delay = $urandom()%10;
        //    repeat(cycle2cycle_delay) @(posedge vif_w.clk);
/*
        repeat(trans2trans_delay) begin
            @(posedge vif_w.clk);
            `DRIV_IF_W.valid    <= 1'b0;
            `DRIV_IF_W.last     <= 1'bx;
            `DRIV_IF_W.data     <= 'hx;
            //int delay = $urandom()%10;
        end */
