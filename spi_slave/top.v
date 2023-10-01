module top_slave_spi
(
input clk_12MHz,

input i_SPI_MOSI,
input i_SPI_CLK,
input i_SPI_CS,
output reg o_SPI_MISO

);

reg [7:0] rx_byte_tp = 8'b0;
reg [7:0] rx_byte = 8'b0;
reg [2:0] rx_counter = 3'b0;
reg rx_done = 1'b0;
reg [7:0] tx_count = 8'd38;
//reg tx_ready = 1'b0;
reg [39:0] tx_byte = 39'h5925A2B012;

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


 //always @(posedge i_SPI_CLK or posedge i_SPI_CS)
 //begin
//  if (i_SPI_CS)
//  begin
//    r_Preload_MISO <= 1'b1;
//  end
//  else
// begin
//    r_Preload_MISO <= 1'b0;
//  end
// end



always @ (posedge i_SPI_CLK or posedge i_SPI_CS)
begin
if(~i_SPI_CS)
  begin
  tx_count <= tx_count - 1;
  o_SPI_MISO <= tx_byte[tx_count];
  end
  else
    begin
      tx_count <= 8'd38;
    end
end



// assign w_SPI_MISO_Mux = r_Preload_MISO ? tx_byte[7] : r_SPI_MISO_Bit;


 //assign o_SPI_MISO = i_SPI_CS ? 1'bZ : w_SPI_MISO_Mux;



endmodule
