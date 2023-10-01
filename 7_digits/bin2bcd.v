`timescale 1ns / 1ps

module bin_to_bcd
(
input [11:0] bin,
output reg[3:0] ONES,
output reg[3:0] TENS,
output reg[3:0] HUNDREDS
);


parameter  bin_bits = 12;

integer i;

always @(bin)
begin
	ONES=0;
	TENS=0;
	HUNDREDS=0;

for(i=12;i>=0;i=i-1)  //26 bit binary value
begin

	if(HUNDREDS>=5)
	HUNDREDS=HUNDREDS+3;


  if(TENS>=5)
	TENS=TENS+3;

	if(ONES>=5)
	ONES =ONES+3;


	HUNDREDS = HUNDREDS<<1;
	HUNDREDS[0] = TENS[3];

	TENS = TENS <<1;
	TENS[0] = ONES[3];

	ONES = ONES <<1;
	ONES[0] = bin[i];
end //for loop end
end//always end

endmodule
