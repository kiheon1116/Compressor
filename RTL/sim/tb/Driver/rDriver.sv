`define DRIV_IF_R vif_r.DRIVER_R.driver_cb_r
class rdriver;    // r

    virtual AXI_R_INTF vif_r;

    mailbox gen2rdriv;
    function new(virtual AXI_R_INTF vif_r,mailbox gen2rdriv);
        this.vif_r     = vif_r;
        this.gen2rdriv     = gen2rdriv;
    endfunction

    task reset;
        wait (!vif_r.rst_n);    // #5;
        $display("[ DRIVER ] ----- Reset Started ----- ");

        `DRIV_IF_R.rready        <= 0;

        wait (vif_r.rst_n);    // #5;
        $display("[ DRIVER ] ----- Reset Ended -----");
    endtask

    task run;
        transaction trans;
        forever begin
            gen2rdriv.get(trans);
        //    `DRIV_IF_R.rready <= ($urandom()%4 < 2);
            `DRIV_IF_R.rready <=  1'b1;
//            while(`DRIV_IF_R.rvalid) begin
//                @(posedge vif_r.clk);
//            end
        end
    endtask
endclass


