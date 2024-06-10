`timescale 1ns / 1ps

module RegisterFile_tb;

  // Inputs
  logic clk = 1'b0;
  logic rst = 1'b0;
  logic reg_wr_en = 1'b0;
  logic [31:0] instruction;
  logic [31:0] wr_data;
  
  // Outputs
  logic [31:0] rd_data1;
  logic [31:0] rd_data2;

  // Instantiate the RegisterFile module
  RegisterFile dut (
    .clk(clk),
    .rst(rst),
    .reg_wr_en(reg_wr_en),
	 .instruction(instruction),
    .wr_data(wr_data),
    .rd_data1(rd_data1),
    .rd_data2(rd_data2)
  );

  // Clock generation
  always #5 clk = ~clk;

  // Testbench stimulus
  initial begin
    // Apply reset and other inputs
    rst = 1;
    reg_wr_en = 0;
	 instruction =32'b0;
    wr_data = 32'b0;

    // De-assert reset
    #10 rst = 0;

    // Write data to register 5
    #10 reg_wr_en = 1;
    instruction = 32'h01498933;
    wr_data = 32'd42;

    // Read data from register 5 and 10
    #10 reg_wr_en = 0;


    // Finish simulation
    #10 $finish;
  end

endmodule
