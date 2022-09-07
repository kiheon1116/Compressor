`define DRIV_IF_W vif_w.DRIVER_W.driver_cb_w
`define DRIV_IF_RD vif_rd.DRIVER_RD.driver_cb_rd



class wdriver;    // w

    int no_transactions;

    virtual AXI_W_INTF vif_w;
    virtual AXI_R_INTF vif_rd;

    mailbox gen2driv;
    
    function new(virtual AXI_W_INTF vif_w, virtual AXI_R_INTF wif_rd, mailbox gen2driv);
        this.vif_w     = vif_w;
        this.vif_rd     = vif_rd;
        this.gen2driv     = gen2driv;
    endfunction

    task reset;
        wait (!vif_w.rst_n);    // #5;
        $display("[ DRIVER ] ----- Reset Started ----- ");

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
                `DRIV_IF_W.wvalid               <= trans.valid;
                `DRIV_IF_W.wlast                <= (i==15);
                `DRIV_IF_W.wdata                <= trans.data[i];
                //      $display($time," cnt : %0d data = %h", i, trans.data[i]);
                @(posedge vif_w.clk);
                while (!`DRIV_IF_W.wready) begin
                    @(posedge vif_w.clk);
                end
                `DRIV_IF_W.wvalid               <= 1'b0;
                `DRIV_IF_W.wlast                <= 1'bx;
                `DRIV_IF_W.wdata                <= 'hx;
                //int delay = $urandom()%10;
                repeat(cycle2cycle_delay) @(posedge vif_w.clk);
            end
            `DRIV_IF_W.wvalid               <= 1'b0;
            `DRIV_IF_W.wlast                <= 1'bx;
            `DRIV_IF_W.wdata                <= 'hx;
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
