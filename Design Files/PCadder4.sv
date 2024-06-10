module PCadder4 (
    input logic [31:0] current_addr, 
    output logic [31:0] next_addr 
);

	assign next_addr = current_addr + 32'd1;

endmodule
