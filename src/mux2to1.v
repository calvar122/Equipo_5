module mux2to1
#(
	parameter N = 32
)
(
	input				  sel,
	input		[N-1:0] d0,
	input		[N-1:0] d1,	
	output reg [N-1:0] Mux_o
);

	always @(*) begin
		case (sel)
			0 : Mux_o = d0;
			1 : Mux_o = d1;
			endcase
		end
	endmodule 