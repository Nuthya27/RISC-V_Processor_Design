module Controller(
  input logic [4:0] controlMemAddr, 
  
  output logic [3:0] aluOp,	//alu operation
  output logic [2:0] immSel,
  output logic [1:0] wrbk,	//writeback
  output logic aluB, memWrEn, regWrEn, pcSel
);

  // Control Memory (ROM) to store microinstructions
	reg [13:0] control_memory [31:0]; // 32x13 control memory (64 opcodes, 16 control signals)
	logic[13:0] microinstruction;
	assign microinstruction = control_memory[controlMemAddr];
	
		always_comb 
			begin
			
			for (int i = 0; i <= 31; i = i + 1) begin
			  control_memory[i] = 13'b0; // Initialize all memory locations to zero
			end
	
		control_memory[1] = 13'b001010000XXX0;	//add
		control_memory[2] = 13'b001010001XXX0;	//sub
		control_memory[3] = 13'b001011010XXX0;	//slt
		control_memory[4] = 13'b001011011XXX0;	//sltu
		control_memory[5] = 13'b001010111XXX0;	//xor
		control_memory[6] = 13'b001010110XXX0;	//or
		control_memory[7] = 13'b001010101XXX0;	//and
		control_memory[8] = 13'b001010010XXX0;	//sll
		control_memory[9] = 13'b001010011XXX0;	//srl
		control_memory[10] = 13'b001010100XXX0;	//sra
		
		control_memory[11] = 13'b1010100000000;	//addi
		control_memory[12] = 13'b1010110100000;	//slti
		control_memory[13] = 13'b1010110110100;	//sltiu
		control_memory[14] = 13'b1010101110000;	//xori
		control_memory[15] = 13'b1010101100000;	//ori
		control_memory[16] = 13'b1010101010000;	//andi
		control_memory[17] = 13'b1010100100010;	//slli
		control_memory[18] = 13'b1010100110010;	//srli
		control_memory[19] = 13'b1010101000010;	//srai
		
		control_memory[20] = 13'b1000100000000;	//load
		
		control_memory[21] = 13'b1011000000110;	//store
		
		control_memory[22] = 13'b0XX0010001000;	//beq-0,bne-1,blt-0,bge-0,bltu-0,bgeu-0
		control_memory[23] = 13'b0XX0010001001;	//beq-1,bne-0,blt-1,bge-1,bltu-1,bgeu-1
		
		control_memory[24] = 13'b1100100000001;	//jalr
		
		control_memory[25] = 13'b001011100XXX0;	//mul
		//control_memory[26] = 13'b01100100000001;	//memcopy

	end


		
      // Set the control signals based on the microinstruction

      assign aluB	= microinstruction[12];
      assign wrbk = microinstruction[11:10];
      assign memWrEn = microinstruction[9];
      assign regWrEn = microinstruction[8];
      assign aluOp = microinstruction[7:4];
      assign immSel = microinstruction[3:1];
      assign pcSel = microinstruction[0];

endmodule
