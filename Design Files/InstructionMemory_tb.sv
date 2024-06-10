module InstructionMemory_tb;

    logic [31:0] ins_addr;
    logic [31:0] instruction;

    InstructionMemory dut (
        .ins_addr(ins_addr),
        .instruction(instruction)
    );


    logic clk = 0;
    always begin
        #5 clk = ~clk;
    end

    initial begin
        ins_addr = 32'd0;
        #10 ins_addr = 32'd1;
        #10 ins_addr = 32'd2;

    end



endmodule


