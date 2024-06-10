module Mux2_tb;

  logic [31:0] d0, d1;
  logic sel;
  logic [31:0] y;

  Mux2 dut (
    .d0(d0),
    .d1(d1),
    .sel(sel),
    .y(y)
  );

  initial begin

    d0 = 32'h01234567;
    d1 = 32'h89ABCDEF;
    sel = 0;

    #10;
    sel = 1; 
    #10; 

  end


endmodule
