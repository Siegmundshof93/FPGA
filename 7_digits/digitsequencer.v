module sequencer
(
input clk,
input [3:0] ones,
input [3:0] tens,
input [3:0] hunds,


output reg gateOne,
output reg gateTwo,
output reg gateThree,

output reg [3:0] out_bcd
);

 reg [23:0] count = 24'b0;
 reg [23:0] COUNT_1 = 24'd0;
 reg [23:0] COUNT_2 = 24'd1;
 reg [23:0] COUNT_3 = 24'd2;
 reg [23:0] COUNT_4 = 24'd3;


always @ (posedge clk)
begin
  if(count == COUNT_1)
    begin
     gateOne    <= 1'b1;
     gateTwo    <= 1'b1;
    gateThree   <= 1'b0;
      out_bcd = hunds;

    count <= count + 1;
    end
    else if (count == COUNT_2)
    begin
     gateOne   <= 1'b1;
     gateTwo   <= 1'b0;
     gateThree  <= 1'b1;
      out_bcd = tens;

    count <= count + 1;
    end
  else if (count == COUNT_3)
    begin
    gateOne   <= 1'b0;
    gateTwo   <= 1'b1;
     gateThree  <= 1'b1;
      out_bcd = ones;

    count <= count + 1;
    end
  else if(count == COUNT_4)
    begin
      count <= 24'b0;

    end

end



endmodule
