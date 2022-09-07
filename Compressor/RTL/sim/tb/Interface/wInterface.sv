interface wintf(input logic clk, rst_n);
	logic [3:0] id;
	logic [63:0] data;
	logic [3:0] strb;
	logic last;
	logic valid;
	logic ready;

  clocking driver_cb_w @(posedge clk);
	//default input #1 output #1;

	// on chip - w
	output id;	
	output data;
	output strb;
	output last;
	output valid;
	// dram - w
	input  ready;

  endclocking
	
 clocking driver_cb_wd @(posedge clk);
	//default input #1 output #1;

	// on chip - w
	input id;	
	input data;
	input strb;
	input last;
	input valid;
	// dram - w
	output  ready;

  endclocking
/*  clocking monitor_cb_wi @(posedge clk);
	//default input #1 output #1;

	// on chip - w
	input ready;
	// dram - w
	input id;
	input data;
	input strb;
	input last;
	input valid;

endclocking
*/
clocking monitor_cb_wd @(posedge clk);
	//default input #1 output #1;

	// on chip - w
	input ready;
	// dram - w
	input id;
	input data;
	input strb;
	input last;
	input  valid;

endclocking

	

  modport DRIVER_W (clocking driver_cb_w, input clk, rst_n);
  modport DRIVER_WD (clocking driver_cb_wd, input clk, rst_n);

 // modport MONITOR_WI (clocking monitor_cb_wi, input clk, rst_n);
  modport MONITOR_W (clocking monitor_cb_wd, input clk, rst_n);

endinterface



