module WrapperDP
#(
	parameter DataWidth = 32
)
(
	// INPUTS
	input            clk,
	input 	       reset,
	input	 [7:0]    GPIO_i,//<--esto sw7:sw0
	//OUTPUTS
	output [7:0]    GPIO_o,
	
	//cONTROL sIGNALS
	input   PCWrite,
	input   [1:0]PCSrc,	//bj
	input   RegWrite,
	input   IorD,
	input   MemWrite,
	input   IRWrite,
	input  [1:0] RegDst,
	input   MemtoReg,//[1:0]in bj
	input   ALUSrcA,
	input	 [1:0] gpio_i,	//<---esto
	input  [1:0] ALUSrcB,
	input  [2:0] ALUControl,
	input 	final,
	output [5:0] Op,
	output [5:0] Funct,
	output		 Zero
);

DataPath DUV(	.clk(clk), 					.reset(reset), 		
					.GPIO_i(GPIO_i), 			.GPIO_o(GPIO_o), 		
					.PCWrite(PCWrite), 		.PCSrc(PCSrc), 			
					.RegWrite(RegWrite), 	.IorD(IorD), 		
					.MemWrite(MemWrite),		.IRWrite(IRWrite), 	
					.RegDst(RegDst), 			.MemtoReg(MemtoReg), 
					.ALUSrcA(ALUSrcA),		.gpio_i(gpio_i),		
					.ALUSrcB(ALUSrcB),		.ALUControl(ALUControl),
					.Op(Op),						.Funct(Funct),
					.Zero(Zero),				.final(final)
);

endmodule
