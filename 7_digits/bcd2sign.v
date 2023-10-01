module bcd_to_seg (
    bcd,
	 segment
    );

input [3:0]bcd;
output reg [6:0]segment;

always @(bcd)
begin
case(bcd)
4'b0000:begin				//0
segment[0] = 1'b1; //a
segment[1] = 1'b1; //b
segment[2] = 1'b1; //c
segment[3] = 1'b1; //d
segment[4] = 1'b1; //e
segment[5] = 1'b1; //f
segment[6] = 1'b0; //g
end
4'b0001:begin				//1
segment[0] = 1'b0; //a
segment[1] = 1'b1; //b
segment[2] = 1'b1; //c
segment[3] = 1'b0; //d
segment[4] = 1'b0; //e
segment[5] = 1'b0; //f
segment[6] = 1'b0; //g
end
4'b0010:begin				//2
segment[0] = 1'b1; //a
segment[1] = 1'b1; //b
segment[2] = 1'b0; //c
segment[3] = 1'b1; //d
segment[4] = 1'b1; //e
segment[5] = 1'b0; //f
segment[6] = 1'b1; //g
end
4'b0011:begin				//3
segment[0] = 1'b1; //a
segment[1] = 1'b1; //b
segment[2] = 1'b1; //c
segment[3] = 1'b1; //d
segment[4] = 1'b0; //e
segment[5] = 1'b0; //f
segment[6] = 1'b1; //g
end
4'b0100:begin				//4
segment[0] = 1'b0; //a
segment[1] = 1'b1; //b
segment[2] = 1'b1; //c
segment[3] = 1'b0; //d
segment[4] = 1'b0; //e
segment[5] = 1'b1; //f
segment[6] = 1'b1; //g
end
4'b0101:begin				//5
segment[0] = 1'b1; //a
segment[1] = 1'b0; //b
segment[2] = 1'b1; //c
segment[3] = 1'b1; //d
segment[4] = 1'b0; //e
segment[5] = 1'b1; //f
segment[6] = 1'b1; //g
end
4'b0110:begin				//6
segment[0] = 1'b1; //a
segment[1] = 1'b0; //b
segment[2] = 1'b1; //c
segment[3] = 1'b1; //d
segment[4] = 1'b1; //e
segment[5] = 1'b1; //f
segment[6] = 1'b1; //g
end
4'b0111:begin				//7
segment[0] = 1'b1; //a
segment[1] = 1'b1; //b
segment[2] = 1'b1; //c
segment[3] = 1'b0; //d
segment[4] = 1'b0; //e
segment[5] = 1'b0; //f
segment[6] = 1'b0; //g
end
4'b1000:begin				//8
segment[0] = 1'b1; //a
segment[1] = 1'b1; //b
segment[2] = 1'b1; //c
segment[3] = 1'b1; //d
segment[4] = 1'b1; //e
segment[5] = 1'b1; //f
segment[6] = 1'b1; //g
end
4'b1001:begin				//9
segment[0] = 1'b1; //a
segment[1] = 1'b1; //b
segment[2] = 1'b1; //c
segment[3] = 1'b1; //d
segment[4] = 1'b0; //e
segment[5] = 1'b1; //f
segment[6] = 1'b1; //g
end

default:
begin
segment[0] = 1'b1; //a
segment[1] = 1'b1; //b
segment[2] = 1'b1; //c
segment[3] = 1'b1; //d
segment[4] = 1'b1; //e
segment[5] = 1'b1; //f
segment[6] = 1'b1; //g
end

endcase

end

endmodule
