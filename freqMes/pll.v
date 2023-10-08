module pll (
    input in_clk,
    output out_clk
);
    
SB_PLL40_CORE#(
.FEEDBACK_PATH("SIMPLE"),
.PLLOUT_SELECT("GENCLK"),
.DIVR(4'b0000),
.DIVF(7'b0111111),
.DIVQ(3'b100),
.FILTER_RANGE(3'b001)
) pll (
    .REFERENCECLK(in_clk),
    .PLLOUTCORE(out_clk),
   .LOCK(),
   .RESETB(1'b1),
   .BYPASS(1'b0)
);


endmodule