module AddressDecorder(
	input logic [31:0] ins,
	input logic blt,bge,zero,
	output logic [4:0] Y
);

	logic [6:0] opcode;
	logic [2:0] func3;
	logic [6:0] func7;
	
	assign opcode = ins[6:0];
	assign func3 = ins[14:12];
	assign func7 = ins[31:25];
	
	
assign Y = ((opcode == 7'b0110011) && (func3 == 3'b000) && (func7 == 7'b0000000)) ? 5'd1 :	//add
          ((opcode == 7'b0110011) && (func3 == 3'b000) && (func7 == 7'b0100000)) ? 5'd2 :	//sub
          ((opcode == 7'b0110011) && (func3 == 3'b010) && (func7 == 7'b0000000)) ? 5'd3 :	//slt
          ((opcode == 7'b0110011) && (func3 == 3'b011) && (func7 == 7'b0000000)) ? 5'd4 :	//sltu
          ((opcode == 7'b0110011) && (func3 == 3'b100) && (func7 == 7'b0000000)) ? 5'd5 :	//xor
			 ((opcode == 7'b0110011) && (func3 == 3'b110) && (func7 == 7'b0000000)) ? 5'd6 :	//or
			 ((opcode == 7'b0110011) && (func3 == 3'b111) && (func7 == 7'b0000000)) ? 5'd7 :	//and
			 ((opcode == 7'b0110011) && (func3 == 3'b001) && (func7 == 7'b0000000)) ? 5'd8 :	//sll
			 ((opcode == 7'b0110011) && (func3 == 3'b101) && (func7 == 7'b0000000)) ? 5'd9 :	//srl
			 ((opcode == 7'b0110011) && (func3 == 3'b101) && (func7 == 7'b0100000)) ? 5'd10 :	//sra
			 
			 ((opcode == 7'b0010011) && (func3 == 3'b000) ) ? 5'd11 :	//addi
          ((opcode == 7'b0010011) && (func3 == 3'b010) ) ? 5'd12 :	//slti
          ((opcode == 7'b0010011) && (func3 == 3'b011) ) ? 5'd13 :	//sltui
          ((opcode == 7'b0010011) && (func3 == 3'b100) ) ? 5'd14 :	//xori
			 ((opcode == 7'b0010011) && (func3 == 3'b110) ) ? 5'd15 :	//ori
			 ((opcode == 7'b0110011) && (func3 == 3'b111) ) ? 5'd16 :	//and
			 ((opcode == 7'b0010011) && (func3 == 3'b001) && (func7 == 7'b0000000)) ? 5'd17 :	//slli
			 ((opcode == 7'b0010011) && (func3 == 3'b101) && (func7 == 7'b0000000)) ? 5'd18 :	//srli
			 ((opcode == 7'b0010011) && (func3 == 3'b101) && (func7 == 7'b0100000)) ? 5'd19 :	//srai
			 
			 ((opcode == 7'b0000011) ) ? 7'd20 :	//load
			 ((opcode == 7'b0100011) ) ? 7'd21 :	//store
			 
			 ((opcode == 7'b1100011) && (func3 == 3'b000) && (zero==1'b0)) ? 5'd22 :	//beq
			 ((opcode == 7'b1100011) && (func3 == 3'b000) && (zero==1'b1)) ? 5'd23 :	//beq
			 
			 ((opcode == 7'b1100011) && (func3 == 3'b001) && (zero==1'b0)) ? 5'd23 :	//bne
			 ((opcode == 7'b1100011) && (func3 == 3'b001) && (zero==1'b1)) ? 5'd22 :	//bne

			 ((opcode == 7'b1100011) && (func3 == 3'b100) && (blt==1'b0)) ? 5'd22 :	//blt
			 ((opcode == 7'b1100011) && (func3 == 3'b100) && (blt==1'b1)) ? 5'd23 :	//blt
			 
			 ((opcode == 7'b1100011) && (func3 == 3'b101) && (bge==1'b0)) ? 5'd22 :	//bge
			 ((opcode == 7'b1100011) && (func3 == 3'b101) && (bge==1'b1)) ? 5'd23 :	//bge
			 
			 ((opcode == 7'b1100011) && (func3 == 3'b110) && (blt==1'b0)) ? 5'd22 :	//bltu
			 ((opcode == 7'b1100011) && (func3 == 3'b110) && (blt==1'b1)) ? 5'd23 :	//bltu
			 
			 ((opcode == 7'b1100011) && (func3 == 3'b111) && (bge==1'b0)) ? 5'd22 :	//bgeu
			 ((opcode == 7'b1100011) && (func3 == 3'b111) && (bge==1'b1)) ? 5'd23 :	//bgeu
			 
			 ((opcode == 7'b1100011) && (func3 == 3'b000) ) ? 5'd24 	:	//jalr
			 ((opcode == 7'b0110011) && (func3 == 3'b000) && (func7 == 7'b0010000)) ? 5'd25 : 5'd0;	//mul

endmodule
