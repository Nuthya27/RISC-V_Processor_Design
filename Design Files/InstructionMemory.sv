module InstructionMemory(

    input logic [31:0] ins_addr,
    output logic [31:0] instruction
	 
);

    logic [31:0] ins_mem[255:0];
	 logic [7:0] ins_add;
	 assign ins_add = ins_addr[7:0];
always @*
begin
			ins_mem[0] = 32'h00300293; //addi x5, x0, 3
			ins_mem[1] = 32'h00400313;	//addi x6, x0, 4
			ins_mem[2] = 32'h005303b3;	//add x7, x6, x5
			ins_mem[3] = 32'h40530433;	//sub x8, x6, x5
			ins_mem[4] = 32'h00732623;	//sw x7, x6, 12		mem addr= 4+12 =16 , value = 7
			ins_mem[5] = 32'h0082a8a3;	//sw x8, x5, 17		mem addr= 3+17 =20 , value = 1			
//			ins_mem[6] = 32'h00200493;//addi x9, x0, 2
//			ins_mem[7] = 32'h00600513;	//addi x10, x0, 6
//			ins_mem[8] = 32'h0072c163;	//blt x5, x7, 2
//			ins_mem[9] = 32'h00a48633;	//add x12, x9, x10
//			ins_mem[10] = 32'h00c42b23;	//sw x12, x8, 22		mem addr= 1+22 =23 , value = x12
//			ins_mem[11] = 32'h00a52683;	//lw x13, x10, 10
//			ins_mem[12] = 32'h408687b3;	//sub x15, x13, x8
//			ins_mem[13] = 32'h08f48923;	//sb x15, x9, 146		mem addr= 2+146 =148 , value = 3

			instruction = ins_mem[ins_add];
		end


  
endmodule
