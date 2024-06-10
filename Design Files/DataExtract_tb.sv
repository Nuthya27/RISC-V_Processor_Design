module DataExtract_tb;

    logic [31:0] inst;
    logic [31:0] data;
    logic [31:0] y;

    DataExtract dut (
        .inst(inst),
        .data(data),
        .y(y)
    );
	 
	  logic clk = 0;
  always begin
    #5 clk = ~clk;
  end

    initial begin
        //  (lb)
        inst = 32'h00000003;  
        data = 32'hFFFFFF00; 
        #10;


        // (lh)
        inst = 32'h00001003;  
        data = 32'hFFFF0000; 
        #10;


        // (lbu)
        inst = 32'h00004003;
        data = 32'h000000FF;
        #10;


        // (lhu)
        inst = 32'h00005003;
        data = 32'h0000FFFF; 
        #10;


        //  (lw)
        inst = 32'h00002003;
        data = 32'hA5A5A5A5; 
        #10;

        //(sb)
        inst = 32'h00000023; 
        data = 32'h000000FF;  
        #10;


        //  (sh)
        inst = 32'h00001023;  
        data = 32'h0000FFFF;  
        #10;

        //  (sw)
        inst = 32'h00002023;  
        data = 32'hA5A5A5A5;  
        #10;

        inst = 32'h00000033;  
        data = 32'hABABABAB;  
        #10;



    end


endmodule

