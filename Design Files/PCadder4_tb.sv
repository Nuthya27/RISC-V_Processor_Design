module PCadder4_tb;

  logic [31:0] current_addr;
  logic [31:0] next_addr;


  PCadder4 dut (
    .current_addr(current_addr),
    .next_addr(next_addr)
  );
  
  	   reg clk = 0;
  always begin
    #5 clk = ~clk;
  end


  initial begin
    current_addr = 32'b00000000;
	 #5;
	 current_addr = 32'b00000101;
	 #5;
  end

endmodule
