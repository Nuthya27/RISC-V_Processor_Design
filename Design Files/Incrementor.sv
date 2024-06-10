module Incrementor(
	input logic [31:0] x,
	input logic [31:0] y,
	
	output logic [31:0] next_x,
	output logic [31:0] next_y

);


	assign next_x = x + 32'd1;
	assign next_y = y + 32'd1;
	
endmodule
