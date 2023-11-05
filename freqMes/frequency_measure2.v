module freq_measure2

(
input input_signal,
input period,
//input sample,
//input reference,
output reg [39:0] counter_out
//output reg led
);

reg [39:0] counter;
//reg [39:0] sample_div_counter;
//reg gate_sample;
always @ (posedge input_signal)
begin
  if(period == 1'b1)
    begin
      counter <= counter + 1;
    end
  else if(period == 1'b0)
    begin
      counter <= 40'b0;
    end
end



always @(negedge period)
begin
  if (counter > 40'b0)
    begin
      counter_out <= counter;
    end
end

endmodule