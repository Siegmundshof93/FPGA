module div_clk
(
input clk,


output reg d_clk
);

 reg [25:0] count = 26'b0;
 reg [25:0] COUNT_MAX = 26'd48000000;

always @ (posedge clk)
begin
 if(count == COUNT_MAX)
    begin
      count <= 26'b0;
      d_clk <= ~d_clk;
    end
    else
      begin
    count <= count + 1;
      end
end

endmodule
