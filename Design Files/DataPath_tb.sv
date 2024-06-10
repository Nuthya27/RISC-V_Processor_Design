
module DataPath_tb;
	
	logic clock = 1'b0;
	logic reset;
	logic [31:0] crAdd;
	logic [31:0] aluOut;

	logic [31:0] dataStore;
	 
	 always #5 clock=~clock;	 

    DataPath dut(
	 
		.clock(clock),
		.reset(reset),	
		.crAdd(crAdd),
		.aluOut(aluOut),
		.dataStore(dataStore)
    );

	 
    initial begin

		reset=0;
		#10;
		reset=1;
		#20;

	end

endmodule



