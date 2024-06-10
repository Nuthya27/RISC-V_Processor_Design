module Mux2(
	input logic [31:0] d0, d1,
	input logic sel,
	output logic [31:0] y
);

	assign y = sel ? d1 : d0;  //sel=1 : d1 , sel =0 : d0

endmodule
