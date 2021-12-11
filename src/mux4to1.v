module mux4to1
#(
	parameter N = 32
)
(
	input		[1:0]		  sel,
	input		[N-1:0] d0, d1, d2, d3,	
	output reg [N-1:0] Mux_o
);

	always @(*) begin
		case (sel)
			0 : Mux_o = d0;
			1 : Mux_o = d1;
			2 : Mux_o = d2;
			3 : Mux_o = d3;
			endcase
		end
	endmodule 