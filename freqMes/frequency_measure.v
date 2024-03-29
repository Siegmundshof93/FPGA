module freq_measure1

(
input input_signal,
input period,

output reg [39:0] counter_out
);

reg [39:0] counter;

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
