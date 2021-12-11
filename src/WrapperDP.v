module WrapperDP
#(
	parameter DataWidth = 32
)
(
	// INPUTS
	input            clk,
	input 	       reset,
	//OUTPUTS
	output [7:0]    GPIO_o,
	
	//cONTROL sIGNALS
	input   PCWrite,
	input   PCSrc,
	input   RegWrite,
	input   IorD,
	input   MemWrite,
	input   IRWrite,
	input   RegDst,
	input   MemtoReg,
	input   ALUSrcA,
	input  [1:0] ALUSrcB,
	input  [2:0] ALUControl,
	output [5:0] Op,
	output [5:0] Funct
);

DataPath DUV(.clk(clk), .reset(reset), .GPIO_o(GPIO_o), .PCWrite(PCWrite), .PCSrc(PCSrc), .RegWrite(RegWrite), .IorD(IorD), 
					.MemWrite(MemWrite),		.IRWrite(IRWrite), .RegDst(RegDst), .MemtoReg(MemtoReg), .ALUSrcA(ALUSrcA), .ALUSrcB(ALUSrcB), 
					.ALUControl(ALUControl),.Op(Op), .Funct(Funct)
);

endmodule
