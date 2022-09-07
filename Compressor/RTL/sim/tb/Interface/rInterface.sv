interface rintf(input logic clk, rst_n);

	logic [3:0] id;
	logic [63:0] data;
	logic [1:0] resp;
	logic last;
	logic valid;
	logic ready;
	
  clocking driver_cb_rd @(posedge clk);
	//default input #1 output #1;

	// on chip - r
	input ready;
	// dram - r
	output id;
	output data;
	output resp;
	output last;
	output valid;

  endclocking
 clocking driver_cb_r @(posedge clk);
	default input #1 output #1;

	// on chip - r
	output ready;
	// dram - r
	input id;
	input data;
	input resp;
	input last;
	input valid;

  endclocking
/*
clocking monitor_cb_ri @(posedge clk);
	//default input #1 output #1;

//	// on chip - r
//	input id;
//	input resp;
//	input data;
//	input last;
//	input valid;
	// dram - r
	input ready;
	
  endclocking
  */
  clocking monitor_cb_r @(posedge clk);
	//default input #1 output #1;

	// on chip - r
	input id;
	input resp;
	input data;
	input last;
	input valid;
	// dram - r
	input ready;
	
  endclocking


  modport DRIVER_RD (clocking driver_cb_rd, input clk, rst_n);
  modport DRIVER_R (clocking driver_cb_r, input clk, rst_n);

//  modport MONITOR_RI (clocking monitor_cb_ri, input clk, rst_n);
  modport MONITOR_R (clocking monitor_cb_r, input clk, rst_n);


endinterface
