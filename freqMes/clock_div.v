module div_clk
(
input clk,


output reg d_clk
);

 reg [26:0] count = 27'b0;
 reg [26:0] COUNT_MAX = 27'd72000000;

always @ (posedge clk)
begin
 if(count == COUNT_MAX)
    begin
      count <= 27'b0;
      d_clk <= ~d_clk;
    end
    else
      begin
    count <= count + 1;
      end
end

endmodule
