module RegisterFile(
	input logic clk,
	input logic rst,   // when rst =0 all registers set to 0
	input logic reg_wr_en,  //write enable
	input logic [31:0] instruction,
	input logic [31:0] wr_data, //data to be written
	
	output logic [31:0] rd_data1, //data read from read register 1
	output logic [31:0] rd_data2 //data read from read register 2
);

	logic [4:0] wr_reg; //write register address(5bits)
	logic [4:0] rd_reg1;  //read register 1
	logic [4:0] rd_reg2;  //read register 2

	assign wr_reg = instruction[11:7];
	assign rd_reg1 = instruction[19:15];
	assign rd_reg2 = instruction[24:20];
	


integer i;
logic [31:0] reg_file [31:0]; //register file as an array of 32, 32 bit registers



always @(posedge clk) begin
	
	if (rst==1'b0)
		for (i=0; i<32; i++)
			reg_file[i] <=32'b0;
	else if (rst==1'b1 && reg_wr_en==1'b1)
		reg_file[wr_reg] <= wr_data;  //write data written to write register
end

	assign rd_data1 = reg_file[rd_reg1];
	assign rd_data2 = reg_file[rd_reg2];

endmodule
