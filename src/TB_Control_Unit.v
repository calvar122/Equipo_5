//`timescale 1ns/100ps
module TB_Control_Unit;

	reg         clk_tb = 0;
	reg       reset_tb;

	reg	 [5:0] Op_tb;
	reg	 [5:0] Funct_tb;
	

	// Control signals
	wire 		       PC_Write_tb;
	wire 			I_or_D_tb;
        wire			Mem_Write_tb;
	wire 			IR_Write_tb;
        wire 			Reg_Dst_tb;
        wire			Mem_to_Reg_tb;
	wire 			Reg_Write_tb;
	wire 			ALU_Src_A_tb;
	wire	[1:0]	ALU_Src_B_tb;
	wire	[2:0]	ALU_Control_tb;
	wire 			PC_Src_tb;

Control_Unit DUT(.clk(clk_tb), .reset(reset_tb), .Op(Op_tb), .Funct(Funct_tb), .PC_Write(PC_Write_tb), .I_or_D(I_or_D_tb),
						.Mem_Write(Mem_Write_tb), .IR_Write(IR_Write_tb), .Reg_Dst(Reg_Dst_tb), .Mem_to_Reg(Mem_to_Reg_tb),
						.Reg_Write(Reg_Write_tb), .ALU_Src_A(ALU_Src_A_tb), .ALU_Src_B(ALU_Src_B_tb), .ALU_Control(ALU_Control_tb),
						.PC_Src(PC_Src_tb));

initial begin						
forever #1 clk_tb = ~clk_tb; 
end
						
initial	begin 
#0 reset_tb = 0; 
#2 reset_tb = 1; 
end

initial begin 
#0 Op_tb = 001000; //ADDI
//#0 Funct_tb = 000000;
#17 Op_tb = 000000;	//ADD
//#0 Funct_tb = 100000;

end
endmodule
