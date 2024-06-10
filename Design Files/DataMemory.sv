module DataMemory(
	//memory address size = 8 bits , total memory adresses = 2^8, address width =32
	
	input logic clk,
	input logic wr_en, //write enable
	input logic [31:0] addr,  //address to be written or read from
	input logic [31:0] wr_data,  //data to be written
	input logic [7:0] extaddr,
	output logic [31:0] rd_data, extdata  //data read from memory address
	

);

	//memory as an array
	logic [31:0] data_mem[(2**8)-1:0]; //2^8 addresses of width 32
	logic [7:0] data_add;
	assign data_add = addr[7:0];

	assign rd_data = data_mem[data_add];
	assign extdata = data_mem[extaddr];
	
	always @(posedge clk) begin
		if (wr_en) begin
			data_mem[data_add] = wr_data;
		//	extaddr = data_add;
		//	extdata = wr_data;
		end
	end

endmodule
