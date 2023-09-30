module top_slave_spi
(
input clk_12MHz,

input i_SPI_MOSI,
input i_SPI_CLK,
input i_SPI_CS,
output reg o_SPI_MISO,

output reg led_0,
output reg led_1,
output reg led_2,
output reg led_3

);

reg [7:0] rx_byte_tp = 8'b0;
reg [7:0] rx_byte = 8'b0;
reg [2:0] rx_counter = 3'b0;
reg rx_done = 1'b0;
reg [15:0] tx_count = 16'd22;
//reg tx_ready = 1'b0;
reg [15:0] tx_byte = 16'h815A;

reg r_SPI_MISO_Bit;
reg r_Preload_MISO;

wire SPI_MISO_Mux;

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
      rx_done <= 1'b0;

    end // end positive CS
end // end always function


//always @ (posedge clk_12MHz)
//begin
//if(rx_byte == 8'h01)
//  begin
//    tx_ready = 1'b1;
//  end
//end


// always @(posedge w_SPI_Clk or posedge i_SPI_CS_n)
// begin
//  if (i_SPI_CS_n)
//  begin
//    r_Preload_MISO <= 1'b1;
//  end
//  else
//  begin
//    r_Preload_MISO <= 1'b0;
//  end
// end



always @ (posedge i_SPI_CLK)
 begin
  if(~i_SPI_CS & rx_done)
    begin
        tx_count <= tx_count - 1;
        o_SPI_MISO <= tx_byte[tx_count];
      end
  else
    begin
      tx_count <= 16'd22;
    end
end

// assign w_SPI_MISO_Mux = r_Preload_MISO ? r_TX_Byte[3'b110] : r_SPI_MISO_Bit;


// assign o_SPI_MISO = i_SPI_CS ? 1'bZ : w_SPI_MISO_Mux;



endmodule
