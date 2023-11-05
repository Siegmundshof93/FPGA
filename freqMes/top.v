module top_design
(
input  clk_12MHz,
input  freq_not,
input  freq_etalon,



input i_SPI_CLK,
input i_SPI_CS,
input i_SPI_MOSI,
output o_SPI_MISO,
);

reg [39:0] test1 = 40'h0102030405;
reg [39:0] test2 = 40'h1122334455;

wire clk_1Hz;
wire clk_test;
wire clk_72MHz;


wire [39:0] counter_not;
wire [39:0] counter_etalon;


pll p1
(clk_12MHz, clk_72MHz);

div_clk c1
(clk_72MHz, clk_1Hz);

freq_measure1 f1
(freq_not, clk_1Hz, counter_not);

freq_measure2 f2
(freq_etalon, clk_1Hz, counter_etalon);

slave_spi s1
(counter_not, counter_etalon, i_SPI_MOSI, i_SPI_CLK, i_SPI_CS, o_SPI_MISO);


endmodule