module top_design
(
input  clk_12MHz,
input  freq_not,
input  freq_etalon,



input i_SPI_CLK,
input i_SPI_CS,
input i_SPI_MOSI,
output o_SPI_MISO
);

reg [39:0] test1 = 40'h0000000001;
reg [39:0] test2 = 40'h0000004455;
reg [39:0] test3 = 40'h005456789A;
reg [39:0] test4 = 40'h0062223334;
wire clk_1Hz;

wire clk_72MHz;


wire [39:0] counter_not;

wire [39:0] Nx;             // frequency counter of the second crystal
wire [39:0] Ns;             // reference counter of the second crystal


pll p1
(clk_12MHz, clk_72MHz);

div_clk c1
(clk_72MHz, clk_1Hz);

freq_measure1 f1
(freq_etalon, clk_1Hz, counter_not);

freq_measure2 f2
(freq_etalon, clk_72MHz, clk_1Hz, Nx, Ns);

slave_spi s1
(counter_not, Nx, Ns, i_SPI_MOSI, i_SPI_CLK, i_SPI_CS, o_SPI_MISO);



endmodule