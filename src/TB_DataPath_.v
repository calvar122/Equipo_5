//Daniela Nájar Medrano

//`timescale 1ns/100ps

module TB_DataPath_;

parameter DataWidth = 32;

   reg   clk = 0;
   reg   reset;
	reg   PCWrite_tb;
	reg   PCSrc_tb;
	reg   RegWrite_tb;
	reg   IorD_tb;
	reg   MemWrite_tb;
	reg   IRWrite_tb;
	reg   RegDst_tb;
	reg   MemtoReg_tb;
	reg   ALUSrcA_tb;
	reg  [1:0] ALUSrcB_tb;
	reg  [2:0] ALUControl_tb;
	
	wire [5:0] Op_tb;
	wire [5:0] Funct_tb;
   wire [7:0] GPIO_o_tb;

	DataPath 
#(
	.DataWidth(DataWidth)
)
DUT
(.clk(clk), .reset(reset), .PCWrite(PCWrite_tb), .PCSrc(PCSrc_tb), .RegWrite(RegWrite_tb), 
	.IorD(IorD_tb), .MemWrite(MemWrite_tb), .IRWrite(IRWrite_tb), .RegDst(RegDst_tb), .MemtoReg(MemtoReg_tb),
	.ALUSrcA(ALUSrcA_tb), .ALUSrcB(ALUSrcB_tb), .ALUControl(ALUControl_tb), .Op(Op_tb), .Funct(Funct_tb),
	.GPIO_o(GPIO_o_tb));

initial // Clock generator
  begin
    forever #2 clk = !clk;
  end
  
//reset
initial	begin 
#0 reset = 0; 
#1 reset = 1; 
end 

//Control Signals
initial 
begin		
	#0 	PCWrite_tb = 0;
	#1 	PCWrite_tb = 1;
	#6 	PCWrite_tb = 0;
	
	#12 	PCWrite_tb = 1;
	#4 	PCWrite_tb = 0;
	
	#12 	PCWrite_tb = 1;
	#4 	PCWrite_tb = 0;
	
	#12 	PCWrite_tb = 1;
	#4 	PCWrite_tb = 0;
	
	#12 	PCWrite_tb = 1;
	#4 	PCWrite_tb = 0;
	
	#12 	PCWrite_tb = 1;
	#4 	PCWrite_tb = 0;
end

initial 
begin 	#0		IorD_tb = 0;
end

initial 
begin #0		MemWrite_tb = 0;
end

initial 
begin		
	#0 	IRWrite_tb = 0;
	#1 	IRWrite_tb = 1;
	#6 	IRWrite_tb = 0;
	
	#12 	IRWrite_tb = 1;
	#4 	IRWrite_tb = 0;
	
	#12 	IRWrite_tb = 1;
	#4 	IRWrite_tb = 0;
	
	#12 	IRWrite_tb = 1;
	#4 	IRWrite_tb = 0;
	
	#12 	IRWrite_tb = 1;
	#4 	IRWrite_tb = 0;
	
	#12 	IRWrite_tb = 1;
	#4 	IRWrite_tb = 0;
end

initial 
begin		
	#0 	RegDst_tb = 0;
	
	#65 	RegDst_tb = 1;
	#2 	RegDst_tb = 0;
	
	#14 	RegDst_tb = 1;
	#2 	RegDst_tb = 0;
	
	#14 	RegDst_tb = 1;
	#2 	RegDst_tb = 0;
end

initial 
begin
	#0		MemtoReg_tb = 0;
end

initial 
begin
	#0		RegWrite_tb = 0;
	#17	RegWrite_tb = 1;
	
	#2		RegWrite_tb = 0;
	#14	RegWrite_tb = 1;
	
	#2		RegWrite_tb = 0;
	#13	RegWrite_tb = 1;
	
	#2		RegWrite_tb = 0;
	#16	RegWrite_tb = 1;
	
	#2		RegWrite_tb = 0;
	#13	RegWrite_tb = 1;
	
	#2		RegWrite_tb = 0;
	#13	RegWrite_tb = 1;
end

initial 
begin		
	#0 	ALUSrcA_tb = 0;
	#7 	ALUSrcA_tb = 1;
	
	#12 	ALUSrcA_tb = 0;
	#5 	ALUSrcA_tb = 1;
	
	#12 	ALUSrcA_tb = 0;
	#5 	ALUSrcA_tb = 1;
	
	#12 	ALUSrcA_tb = 0;
	#5 	ALUSrcA_tb = 1;
	
	#11 	ALUSrcA_tb = 0;
	#5 	ALUSrcA_tb = 1;
	
	#12 	ALUSrcA_tb = 0;
	#5 	ALUSrcA_tb = 1;
end

initial
 begin
	#0		ALUSrcB_tb = 0;
	#1		ALUSrcB_tb = 1;
	#7		ALUSrcB_tb = 2;
	
	#11	ALUSrcB_tb = 1;
	#5		ALUSrcB_tb = 2;
	
	#11	ALUSrcB_tb = 1;
	#5		ALUSrcB_tb = 2;
	
	#11	ALUSrcB_tb = 1;
	#5		ALUSrcB_tb = 0;
	
	#11	ALUSrcB_tb = 1;
	#5		ALUSrcB_tb = 0;
	
	#11	ALUSrcB_tb = 1;
	#5		ALUSrcB_tb = 0;
end

initial
begin
	#0		ALUControl_tb = 2;
end

initial 
begin
	#0		PCSrc_tb = 0;
end

endmodule
