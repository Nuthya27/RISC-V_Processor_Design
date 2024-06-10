`timescale 1ns / 1ps

module Incrementor_tb;

	logic [31:0] x;
	logic [31:0] y;
	logic [31:0] next_x;
	logic [31:0] next_y;
	logic clk = 1'b0;


	Incrementor dut(
	 .x(x),
	 .y(y),
	 .next_x(next_x),
	 .next_y(next_y)	 
	);


	always begin
	#5 clk = ~clk;
	end


	initial begin
	 x = 32'd3;
	 y = 32'd21;
	 #40;  $finish;
	end

endmodule
