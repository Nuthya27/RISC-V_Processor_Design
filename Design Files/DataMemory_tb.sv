`timescale 1ns / 1ps

module DataMemory_tb;

  // Inputs
  reg clk = 0;
  reg wr_en = 0;
  reg [7:0] addr = 0;
  reg [31:0] wr_data = 0;

  // Outputs
  wire [31:0] rd_data;

  // Instantiate the DataMemory module
  DataMemory dut (
    .clk(clk),
    .wr_en(wr_en),
    .addr(addr),
    .wr_data(wr_data),
    .rd_data(rd_data)
  );

  // Clock generation
  always #5 clk = ~clk;

  // Testbench stimulus
  initial begin
    // Write data to memory
    wr_en = 1;
    addr = 5;
    wr_data = 123;
    #10 wr_en = 0;

    // Read data from memory
    addr = 5;
    #10 wr_data = 0; // Clear wr_data to avoid accidental writes

    // Finish simulation
    #10 $finish;
  end

endmodule
