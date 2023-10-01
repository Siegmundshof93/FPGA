module test_freq
(
input clk,


output reg d_clk
);

 reg [23:0] count = 24'b0;
 reg [23:0] COUNT_MAX = 24'd3003; //10Hz

always @ (posedge clk)
begin
 if(count == COUNT_MAX)
    begin
      count <= 24'b0;
      d_clk <= ~d_clk;
    end
    else
      begin
    count <= count + 1;
      end
end

endmodule
