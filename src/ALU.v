module ALU (y, a, b, select);		 // ARITHMETIC UNIT
input		[31: 0]  a, b;
input		[2: 0]  select;
output reg		[31: 0]  y;


always @ (*)
begin
y= 32'b0;
case ({select})
3'b000:	y = a;
3'b001:	y = a - b;
3'b010:	y = a + b;
3'b011:	y = a < b;
3'b100:	y = a ^ b;
3'b101:	y = a + (~b) + 1'b1;
3'b110:	y = a * b;
3'b111:	y = 32'h0;
/*5'b0100_0:	y = a & b;
5'b0101_0:	y = a | b;
5'b0110_0: y = a ^ b;
5'b0111_0:	y = ~a;
5'b1000_0:	y = a << 1;
5'b1001_0:	y = a >> 1;			// 9
5'b1010_0:	y = 0;   */         // 10
default:		y = 32'h0;
endcase
end
endmodule
