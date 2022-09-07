`define MON_IF_WD vif_wd.MONITOR_W.monitor_cb_wd

class wdmonitor;


    virtual AXI_W_INTF vif_wd;

    mailbox wdmon2rddriv;

    function new(virtual AXI_W_INTF vif_wd, mailbox wdmon2rddriv);

        this.vif_wd = vif_wd;
        this.wdmon2rddriv = wdmon2rddriv;
    endfunction
    task run;
        transaction trans;
        wait(vif_wd.rst_n);
        forever begin
            trans = new();
            for (int i=0; i<8; i++) begin
                if (`MON_IF_WD.wvalid && `MON_IF_WD.wready) begin
                    trans.data[i] = `MON_IF_WD.wdata;
                    trans.valid   = `MON_IF_WD.wvalid;
            //        $display($time, "\twtrans.valid = %0d", trans.valid);
                    if((i ==7) &&!`MON_IF_WD.wlast) begin
            //            $error("wlast !");
                    end
                end
                @(posedge vif_wd.clk);
                // check whether last signal is correct
            end
            wdmon2rddriv.put(trans);
        end
    endtask
/*
    task run2;
        forever begin
            transaction trans;
            @(posedge vif_wo.clk);    // #10;
            `MON_IF_WI.ready = ($urandom()%4 < 1);  
            end
    endtask
*/
endclass


