//mips

module mips
(
input clk_i,
input reset_i,
output [7:0] GPIO
);

wire [5:0] OP_w;
wire [5:0] FUNCT_w;

wire PCW_w;
wire IorD_w;
wire MemWrite_w;
wire IRWrite_w;
wire RegDst_w;
wire MemReg_w;
wire RegWrite_w;
wire ALUSrcA_w;
wire [1:0]ALUSrcB_w;
wire [2:0]ALUControl_w;
wire PCSrc_w;

//assign clk = clk_w;
Control_Unit CU(
					.clk(clk_i), 				.reset(reset_i), 				.Op(OP_w),					.Funct(FUNCT_w),				.PC_Write(PCW_w),			
					.I_or_D(IorD_w),			.Mem_Write(MemWrite_w),		.IR_Write(IRWrite_w),	.Reg_Dst(RegDst_w),			.Mem_to_Reg(MemReg_w), 	
					.Reg_Write(RegWrite_w),	.ALU_Src_A(ALUSrcA_w),		.ALU_Src_B(ALUSrcB_w),	.ALU_Control(ALUControl_w),.PC_Src(PCSrc_w) 	
);

WrapperDP DP(
					.clk(clk_i),				.reset(reset_i),				.PCWrite(PCW_w),				.PCSrc(PCSrc_w),				.RegWrite(RegWrite_w),	
					.IorD(IorD_w),				.MemWrite(MemWrite_w), 		.IRWrite(IRWrite_w),			.RegDst(RegDst_w),			.MemtoReg(MemReg_w),	
					.ALUSrcA(ALUSrcA_w),		.ALUSrcB(ALUSrcB_w),			.ALUControl(ALUControl_w),	.Op(OP_w), 						.Funct(FUNCT_w),
					.GPIO_o(GPIO)
);


endmodule
