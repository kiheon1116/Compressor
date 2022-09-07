//`include "Transcation.sv"
//`include "Generator.sv"
//`include "Driver.sv"

class environment;

    generator     gen;
    wdriver      wdriv;
    wddriver      wddriv;
    rddriver      rddriv;
    rdriver      rdriv;
    wdmonitor     wdmon;
    rmonitor     rmon;
    scoreboard     scb;

    mailbox    gen2driv;
    mailbox    gen2rdriv;
    mailbox gen2scb;

    mailbox wdmon2rddriv;
    mailbox rmon2scb;

    event ended;
    

    virtual AXI_W_INTF vif_w; 
    virtual AXI_W_INTF vif_wd;
    virtual AXI_R_INTF vif_rd;
    virtual AXI_R_INTF vif_r;
    

    function new(virtual AXI_W_INTF vif_w, virtual AXI_W_INTF vif_wd, virtual AXI_R_INTF vif_rd, virtual AXI_R_INTF vif_r);
        this.vif_w = vif_w;
        this.vif_wd = vif_wd;
        this.vif_rd = vif_rd;
        this.vif_r = vif_r;
    endfunction

    task init();
        gen2driv     = new();
        gen2rdriv     = new();
        wdmon2rddriv    = new();
        gen2scb         = new();
        rmon2scb      = new();

        gen     = new(gen2driv, gen2rdriv, gen2scb, ended);
        wddriv    = new(vif_wd);
        wdriv    = new(vif_w, vif_rd, gen2driv);
        wdmon    = new(vif_wd, wdmon2rddriv);
        rdriv    = new(vif_r, gen2rdriv);
        rddriv    = new(vif_rd, wdmon2rddriv);
        rmon    = new(vif_r, rmon2scb);
        scb    = new(rmon2scb, gen2scb);
    endtask
    
    task pre_test();
        fork
            wdriv.reset();
            wddriv.reset();
            rddriv.reset();
            rdriv.reset();
        join_any
    endtask
    
    task test();
        fork
            $display("env_test_start");
            gen.run();
            wdriv.run();
            wddriv.run();
            rdriv.run();
            wdmon.run();
            rmon.run();
            scb.run();
            $display("env_test_end");
        join_any
    endtask

    task post_test();
        wait (ended.triggered);
    endtask

    task run;
        init();
        pre_test();
        test();
        post_test();
    //    #79100;
        #1588400;
    endtask

endclass

