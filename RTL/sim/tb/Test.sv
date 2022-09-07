//'include "Environment.sv"

program test(
        AXI_W_INTF icnt_w_intf,
        AXI_W_INTF mc_w_intf,
        AXI_R_INTF mc_r_intf,
        AXI_R_INTF icnt_r_intf);

    environment env;

    initial begin
        $display("Environmnet setup");
        env = new(icnt_w_intf,
                  mc_w_intf,
                  mc_r_intf,
                  icnt_r_intf);

        $display("Run");
        env.run();

        $display("test_ok");
    //    $finish();
    end
endprogram
