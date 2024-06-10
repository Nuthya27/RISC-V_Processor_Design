module ImmediateGenerator_tb;

  reg [31:0] ins;
  reg [2:0] imm_sel;
  wire [31:0] imm_out;

  // Instantiate the ImmediateGenerator module
  ImmediateGenerator dut (
    .ins(ins),
    .imm_sel(imm_sel),
    .imm_out(imm_out)
  );

  // Define the clock signal
  reg clk = 0;
  always begin
    #5 clk = ~clk;
  end

  // Initialize signals
  initial begin
    ins = 32'h12345678; // Example input value
    imm_sel = 3'b000;  // Test with different imm_sel values

    // Test case 1: imm_sel = 000 (signed)
    // Expected output: imm_out = {1'b0, ins[31], 20'b1, ins[31:20]}

    #10;

    // Test case 2: imm_sel = 001 (unsigned)
    // Expected output: imm_out = {27'b0, ins[24:20]}
    imm_sel = 3'b001;
    #10;


    // Test case 3: imm_sel = 010 (unsigned)
    // Expected output: imm_out = {20'b0, ins[31:20]}

    imm_sel = 3'b010;
    #10;

    // Test case 4: imm_sel = 011 (signed)
    // Expected output: imm_out = {1'b0, ins[31], ins[31:25], ins[11:7]}
    imm_sel = 3'b011;
    #10;

    // Test case 5: imm_sel = 100 (signed)
    // Expected output: imm_out = {1'b0, ins[31], ins[7], ins[30:25], ins[11:8], 1'b0}
    imm_sel = 3'b100;
    #10;

  end

  // Clock generation
  always begin
    #5 clk = ~clk;
  end

endmodule


