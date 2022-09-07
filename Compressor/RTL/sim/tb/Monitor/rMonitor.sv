`define MON_IF_R vif_r.MONITOR_R.monitor_cb_r

class rmonitor;

    virtual AXI_R_INTF vif_r;

    mailbox rmon2scb;

    function new(virtual AXI_R_INTF vif_r,  mailbox rmon2scb);
        this.vif_r = vif_r;
        this.rmon2scb = rmon2scb;
    endfunction
/*
    task run;
        int cnt;
        int i;
        forever begin
            transaction trans;
            @(posedge vif_ri.clk);    // #10;
            `MON_IF_RI.ready = ($urandom()%4 < 1);  
        end
    endtask
*/
    task run;
        transaction trans;
        wait(vif_r.rst_n);
        forever begin

        trans = new();
            for (int i=0; i<16; i++) begin
                if (`MON_IF_R.rvalid && `MON_IF_R.rready) begin
                    trans.data[i] = `MON_IF_R.rdata;
            //        $display($time, "\trtrans.data[%0d] = %h ", i, trans.data[i]);
                    if((i ==15) &&!`MON_IF_R.rlast) begin
            //            $error("rlast !");
                    end
                end
                @(posedge vif_r.clk);
                // check whether last signal is correct
            end
            rmon2scb.put(trans);
        end
    endtask
endclass
