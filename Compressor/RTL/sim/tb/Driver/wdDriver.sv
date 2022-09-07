`define DRIV_IF_WD vif_wd.DRIVER_WD.driver_cb_wd
class wddriver;    // wd

    virtual AXI_W_INTF vif_wd;
    
    function new(virtual AXI_W_INTF vif_wd);
        this.vif_wd     = vif_wd;
    endfunction

    task reset;
        wait (!vif_wd.rst_n);    // #5;
        $display("[ DRIVER ] ----- Reset Started ----- ");

        `DRIV_IF_WD.wready            <= 0;

        wait (vif_wd.rst_n);    // #5;
        $display("[ DRIVER ] ----- Reset Ended -----");
    endtask

    task run;
        transaction trans;
        forever begin
            @(posedge vif_wd.clk);
            `DRIV_IF_WD.wready         <= ($urandom()%2 < 1);
        //    `DRIV_IF_WD.wready         <=  1;
         end
    endtask
endclass


