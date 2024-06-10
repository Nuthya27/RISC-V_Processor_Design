module ImmediateGenerator(
    input logic [31:0] ins,
	 input logic [2:0] imm_sel,
    output logic [31:0] imm_out
);

always_comb
	case(imm_sel)
		3'b000:
			imm_out = {ins[31]? 20'b1:20'b0 , ins[31:20]};  //signed: addi, slti, xori, ori, andi, lb, lh, lw, lbu, lhu, jalr
		3'b001:
			imm_out = {27'b0 , ins[24:20]};   //unsigned: slli, srli, srai
		3'b010:
			imm_out = {20'b0 , ins[31:20]};	//unsigned: stliu
		3'b011:
			imm_out = {ins[31]? 20'b1:20'b0 , ins[31:25] , ins[11:7]};	//signed: sb, sh, sw
		3'b100:
			imm_out = {ins[31]? 20'b1:20'b0 , ins[7] , ins[30:25] , ins[11:8] , 1'b0};	//signed: branch
		default: 
         imm_out = {32'b0};	
	endcase
endmodule
