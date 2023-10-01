module top_design
(
input  clk_12MHz,
input  freq_in,
output gateOne,
output gateTwo,
output gateThree,

output reg [3:0] led,
output [6:0] segment
);




wire clk_1Hz;
wire clk_test;
wire [3:0] ones;
wire [3:0] tens;
wire [3:0] hunds;

wire [3:0] bcd_out;

wire [29:0] counter;

div_clk c1
(clk_12MHz, clk_1Hz);

test_freq c5
(clk_12MHz, clk_test);

bcd_to_seg b1
(bcd_out, segment);

bin_to_bcd b4
(counter, ones, tens, hunds);

sequencer s1
(clk_1Hz, ones, tens, hunds, gateOne, gateTwo, gateThree, bcd_out);

freq_measure f1
(freq_in, clk_1Hz, counter);






endmodule
