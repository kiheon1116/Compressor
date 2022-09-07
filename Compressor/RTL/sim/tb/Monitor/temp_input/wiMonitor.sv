`define MON_IF vif.MONITOR.monitor_cb

class wimonitor;		// 수정필요

	virtual wintf vif;

	mailbox mon2scb;

	function new(virtual wintf vif, mailbox mon2scb);
		this.vif = vif;
		this.mon2scb = mon2scb;
	endfunction

	task run;
		int cnt;
		int i;
		forever begin
			transaction trans;
			@(posedge vif.clk);	// #10;
			`MON_IF.wready_i = ($urandom()%4 < 1);  
			end
	endtask

	task run2;
		transaction trans;
		trans = new();
		wait(!vif.rst_n);
		forever begin
			for (int i=0; i<16; i++) begin
				if (`MON_IF.wvalid_o & `MON_IF.wready_i) begin
					trans.data[i] = `MON_IF.wdata_i;
					if((i ==15) &&!`MON_IF.wlast_o) begin
						$error();
					end
				end
				@(posedge vif.clk);
				// check whether last signal is correct
			end
			mon2scb.put(trans);
		end
	endtask
endclass
