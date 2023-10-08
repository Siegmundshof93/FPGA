module top_design
(
input  clk_12MHz,
input  freq_in,

//output reg [3:0] led,

input i_SPI_CLK,
input i_SPI_CS,
input i_SPI_MOSI,
output o_SPI_MISO
);

//reg [39:0] test = 40'h0123456789;


wire clk_1Hz;
wire clk_test;
wire clk_48MHz;


wire [39:0] counter;



pll p1
(clk_12MHz, clk_48MHz);

div_clk c1
(clk_48MHz, clk_1Hz);


freq_measure f1
(freq_in, clk_1Hz, counter);

slave_spi s1
(counter, i_SPI_MOSI, i_SPI_CLK, i_SPI_CS, o_SPI_MISO);




endmodule