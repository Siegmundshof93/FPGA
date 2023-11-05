module top_design
(
input  clk_12MHz,
input  freq_in,



input i_SPI_CLK,
input i_SPI_CS,
input i_SPI_MOSI,
output o_SPI_MISO,
output led
);

reg [39:0] test = 40'h0102030405;


wire clk_1Hz;
wire clk_test;
wire clk_72MHz;


wire [39:0] counter;



pll p1
(clk_12MHz, clk_72MHz);

div_clk c1
(clk_72MHz, clk_1Hz);

freq_measure f1
(freq_in, clk_1Hz, counter);

slave_spi s1
(test, i_SPI_MOSI, i_SPI_CLK, i_SPI_CS, o_SPI_MISO, led);




endmodule