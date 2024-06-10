module ALU (
	input logic [31:0] A,    
	input logic [31:0] B,   
	input logic [3:0] ALUop,  // ALU operation 
	output logic [31:0] ALUout, 
	output logic ZeroFlag, // Zero flag
	output logic BLT, //Branch less than
	output logic BGT //Branch greater than or equal
);

	always_comb
		begin
		ALUout = 32'b0;
		ZeroFlag = 1'b0;
		BLT = 1'b0;
		BGT = 1'b0;
		
		case (ALUop)
		
		4'b0000: ALUout = A + B; // Add
		4'b0001: ALUout = A - B; // Subtraction
		
		4'b0010: ALUout = A << B; // Shift left
		4'b0011: ALUout = A >> B; // Shift right
		4'b0100: ALUout = $signed(A) >>> B; // Shift right arithmetic


		4'b0101: ALUout = A & B; // Bitwise AND
		4'b0110: ALUout = A | B; // Bitwise OR
		4'b0111: ALUout = A ^ B; // Bitwise XOR

		4'b1000:	
			begin //signed branch
			ALUout = $signed(A) - $signed(B); 
			BLT = ($signed(A) < $signed(B));	// Is less than (Signed)
			BGT = ($signed(A) >= $signed(B));	//Is greater than (Signed)
			ZeroFlag = (ALUout == 32'h0);	//Is equal
			end
			
		4'b1001:
			begin //unsigned branch
			ALUout = A - B; 
			BLT = (A < B);// Is less than (Unsigned)
			BGT = (A >= B);
			ZeroFlag = (ALUout == 32'h0);
			end
			
		4'b1010: ALUout = ($signed(A) < $signed(B));	//set less than signed
		4'b1011: ALUout = (A < B);	//set less than unsigned
		
		4'b1100: ALUout = A * B;

		endcase

		end

endmodule
