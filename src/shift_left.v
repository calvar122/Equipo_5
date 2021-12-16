module shift_left #(
	parameter DataWidth = 32
)
(	input  [DataWidth-1:0] shift_i,
	output [DataWidth-1:0] shift_o
);
	assign shift_o = shift_i <<2;

endmodule

