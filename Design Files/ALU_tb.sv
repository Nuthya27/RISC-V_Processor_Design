module ALU_tb;

  logic [31:0] A;
  logic [31:0] B;
  logic [3:0] ALUop;
  logic [31:0] ALUout;
  logic ZeroFlag;
  logic BLT;
  logic BGT;

  ALU dut(
    .A(A),
    .B(B),
    .ALUop(ALUop),
    .ALUout(ALUout),
    .ZeroFlag(ZeroFlag),
    .BLT(BLT),
    .BGT(BGT)
  );


  initial begin

    A = 32'd3;
    B = 32'd12;
    ALUop = 4'b0000; // Add operation
    #10;
    ALUop = 4'b0001; // Subtraction
    #10;
    ALUop = 4'b0010; // Shift left
    #10;
    ALUop = 4'b0011; // Shift right
    #10;
    ALUop = 4'b0100; // Shift right arithmetic
    #10;
    ALUop = 4'b0101; // Bitwise AND
    #10;
    ALUop = 4'b0110; // Bitwise OR
    #10;
    ALUop = 4'b0111; // Bitwise XOR
    #10;
    ALUop = 4'b1000; // Signed branch
    #10;
    ALUop = 4'b1001; // Unsigned branch
    #10;
    ALUop = 4'b1100; // mul
    #10;

    // Terminate the simulation
    $finish;
  end

endmodule
