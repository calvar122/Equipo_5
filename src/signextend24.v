//Sign extended for 24 bits, GPIO_I S7:SW0 implementation

module signextend24
(
	input  [7:0]   Imm,
	output [31:0]   SignImm
);
	assign SignImm = {{24{Imm[7]}},Imm};
	
endmodule 
