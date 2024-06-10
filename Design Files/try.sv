module try(
    input logic clk, reset,
	 input logic [7:0] inadd,
    output logic [6:0] HEX4

);

	logic [31:0] outdata;
	logic [7:0] outVal;
	
	

DataPath dp (
	.clock(clk),
	.reset(reset),
	.exadd(inadd),
	.exdata(outdata)
);



hexdigit H2 (outdata[3:0], HEX4);


endmodule

