module slave_spi
(
input [39:0] tx_byte,
input i_SPI_MOSI,
input i_SPI_CLK,
input i_SPI_CS,
output reg o_SPI_MISO,
output reg led

);

reg [7:0] rx_byte_tp = 8'b0;
reg [7:0] rx_byte = 8'b0;
reg [2:0] rx_counter = 3'b0;
reg rx_done = 1'b0;
reg [7:0] tx_count = 8'd46;







always @ (posedge i_SPI_CLK)
begin
  if(~i_SPI_CS)
    begin
      rx_counter <= rx_counter + 1;
      rx_byte_tp <= {rx_byte_tp[6:0], i_SPI_MOSI};

     if(rx_counter == 3'b111)
        begin
          rx_byte <= {rx_byte_tp[6:0], i_SPI_MOSI};
          rx_done <= 1'b1;
        end //end rx_connter >7
    end // end negative CS
  else
    begin
      rx_counter <= 3'b0;
    rx_byte_tp <= 8'b0;
    

    end // end positive CS
end




always @ (posedge i_SPI_CLK or posedge i_SPI_CS)
  begin

if(~i_SPI_CS)

    begin
    o_SPI_MISO <= rx_byte[tx_count];
    tx_count <= tx_count - 1;
    end
  else
    begin
      tx_count <= 8'd46;
    
    
      end
end // end always function




endmodule
