module signextend 
(
	input  [15:0]   Imm,
	output [31:0]   SignImm
);
	assign SignImm = {{16{Imm[15]}},Imm};
	
endmodule 

