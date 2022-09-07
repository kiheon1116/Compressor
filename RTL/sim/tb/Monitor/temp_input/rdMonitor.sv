`define MON_IF_RI vif_ri.MONITOR_RO.monitor_cb_ro

class rimonitor;

	virtual rintf vif_ri;

	mailbox rimon2wodriv;

	function new(virtual rintf vif_ri,  mailbox romon2scb);
		this.vif_ri = vif_ri;
		this.romon2scb = romon2scb;
	endfunction

	task run;
		transaction trans;
		trans = new();
		wait(vif_ro.rst_n);
		forever begin
			for (int i=0; i<16; i++) begin
				if (`MON_IF_RO.valid && `MON_IF_RO.ready) begin
					trans.data[i] = `MON_IF_RO.data;
			//		$display($time, "\trtrans.data[%0d] = %h ", i, trans.data[i]);
					if((i ==15) &&!`MON_IF_RO.last) begin
						$error("rlast !");
					end
				end
				@(posedge vif_ro.clk);
				// check whether last signal is correct
			end
			romon2scb.put(trans);
		end
	endtask
endclass
