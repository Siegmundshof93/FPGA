module freq_measure

(
input input_signal,
input period,

output reg [29:0] counter_out
);

reg [29:0] counter;

always @ (posedge input_signal)
begin
  if(period == 1'b1)
    begin
      counter <= counter + 1;
    end
  else if(period == 1'b0)
    begin
      counter <= 30'b0;
    end
end



always @(negedge period)
begin
  if (counter > 30'b0)
    begin
      counter_out <= counter;
    end
end

endmodule
