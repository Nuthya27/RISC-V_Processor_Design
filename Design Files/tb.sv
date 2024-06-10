`timescale 1ns/1ps

module tb;

    // Inputs
    reg clk = 0;
    reg reset;
    reg [4:0] sw;

    // Outputs
    wire [6:0] HEX4;

    // Instantiate the module under test
    try dut (
        .clk(clk),
        .reset(reset),
        .sw(sw),
        .HEX4(HEX4)
    );


    always begin
        #10 clk = ~clk;
    end

    // Initial stimulus
    initial begin
        // Initialize inputs
		reset=0;
		#10;
		reset=1;

        sw = 5'b00000;

        // Apply some test vectors
        #10 sw = 5'b00001;  // Assuming this is a positive edge-triggered signal
        #10 sw = 5'b01101;
        #10 sw = 5'b01011;

    end

endmodule
