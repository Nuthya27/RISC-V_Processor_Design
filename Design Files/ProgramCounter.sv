module ProgramCounter (
    input logic clk,       // Clock input
    input logic rst,     // Reset 
    input logic [31:0] next_addr, 
    output logic [31:0] current_addr 
);

//	 always_comb begin
//	  current_addr <= 32'b0;
//	 end

   always @(posedge clk) begin
        if (!rst)
            current_addr <= 32'b0;
        else
            current_addr <= next_addr; 
	end

endmodule
