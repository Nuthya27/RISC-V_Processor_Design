module Comparator(
	input logic [31:0] val,
	input logic [31:0] val_inc,
	input logic [31:0] compare_N,
	
	output logic c
);


	always_comb
		begin
			if ((val_inc-val) == compare_N)
				c = 1'b1;	//stop incrementing
			else
				c = 1'b0;
		end
		
endmodule


