`timescale 1ns /10ps

module spi_slave_tb();

wire    led_0;
wire    led_1;
wire    led_2;
wire    led_3;
wire    o_SPI_MISO = 0;

reg     clk_12MHz = 0;
reg     i_SPI_MOSI = 0;
reg     i_SPI_CLK = 0;
reg     i_SPI_CS = 1'b0;




localparam DURATION = 300000;

 // generate clock signal: 1 / ((2 * 41.67) * 1ns) = 11,99,040.08 MHz

always begin
#41.667
clk_12MHz = ~clk_12MHz;
end

always begin
#5000
i_SPI_CLK = ~i_SPI_CLK;
#250
i_SPI_CLK = ~i_SPI_CLK;
#250
i_SPI_CLK = ~i_SPI_CLK;
#250
i_SPI_CLK = ~i_SPI_CLK;
#250
i_SPI_CLK = ~i_SPI_CLK;
#250
i_SPI_CLK = ~i_SPI_CLK;
#250
i_SPI_CLK = ~i_SPI_CLK;
#250
i_SPI_CLK = ~i_SPI_CLK;
#250
i_SPI_CLK = ~i_SPI_CLK;
#250
i_SPI_CLK = ~i_SPI_CLK;
#250
i_SPI_CLK = ~i_SPI_CLK;
#250
i_SPI_CLK = ~i_SPI_CLK;
#250
i_SPI_CLK = ~i_SPI_CLK;
#250
i_SPI_CLK = ~i_SPI_CLK;
#250
i_SPI_CLK = ~i_SPI_CLK;
#250
i_SPI_CLK = ~i_SPI_CLK;


end

always begin
#20000
i_SPI_CS = ~i_SPI_CS;

end

always begin
#5000
i_SPI_MOSI = 1'b1;
#500
i_SPI_MOSI = 1'b1;
#500
i_SPI_MOSI = 1'b0;
#500
i_SPI_MOSI = 1'b0;
#500
i_SPI_MOSI = 1'b1;
#500
i_SPI_MOSI = 1'b1;
#500
i_SPI_MOSI = 1'b0;
#500
i_SPI_MOSI = 1'b0;

end

top_slave_spi uut (clk_12MHz, i_SPI_MOSI, i_SPI_CLK, i_SPI_CS, o_SPI_MISO, led_0, led_1, led_2, led_3);



initial begin

$dumpfile("spi_slave_tb.vcd");
$dumpvars(0, spi_slave_tb);

#(DURATION)

$display("Finished!");
$finish;

end

endmodule
