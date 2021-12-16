module DataPath 
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
	input   [1:0]PCSrc,
	input   RegWrite,
	input   IorD,
	input   MemWrite,
	input   IRWrite,
	input   RegDst,
	input   MemtoReg,	//in BJ is [1:0]
	input   ALUSrcA,
	input		gpio_i,	//<---SW
	input  [1:0] ALUSrcB,
	input  [2:0] ALUControl,
	output [5:0] Op,
	output [5:0] Funct,
	output		Zero	//BJ
);

	wire [DataWidth-1:0] PC_next;
	wire [DataWidth-1:0] PC;
	wire [DataWidth-1:0] ALUOut;
	wire [DataWidth-1:0] Adr;
	wire [DataWidth-1:0] B;
	wire [DataWidth-1:0] RD;
	wire [DataWidth-1:0] Instr;
	wire [DataWidth-1:0] Data;
	wire [4:0]           A3;
	wire [DataWidth-1:0] WD3;
	wire [DataWidth-1:0] RD1;
	wire [DataWidth-1:0] RD2;
	wire [DataWidth-1:0] A;
	wire [DataWidth-1:0] SignImm;
   wire [DataWidth-1:0] SrcA;
	wire [DataWidth-1:0] SrcB;
	wire [DataWidth-1:0] ALUResult;
	wire [DataWidth-1:0] Branch_shift;	//BJ
	wire [27:0]          Jump_shift;		//BJ
	wire [DataWidth-1:0] sign16t32;
	wire [DataWidth-1:0] sign8t32;		//SW
	
	//Instantiation 
	register register_PC(.clk(clk), .reset(reset), .enable(PCWrite), .data_in((PC_next < 32'h400000) ? 32'h400000 : PC_next), .data_out(PC));
	
	mux2to1 IorD_Mux (.sel(IorD), .d0(PC), .d1(ALUOut), .Mux_o(Adr));
	
	Memory_System Memory (.clk(clk), .Enable(MemWrite), .Address_i(Adr), .Write_Data(B), .Instruction_o(RD));
	
	register register_instruc (.clk(clk), .reset(reset), .enable(IRWrite), .data_in(RD), .data_out(Instr));
	
	register register_data (.clk(clk), .reset(reset), .enable(1'b1), .data_in(RD), .data_out(Data));
	
	mux2to1  #(.N(5)) Mux_rd_rt (.sel(RegDst), .d0(Instr[20:16]), .d1(Instr[15:11]), .Mux_o(A3));
	
	//difference vs BJ it was 4to1
	mux2to1 Data_WD (.sel(MemtoReg), .d0(ALUOut), .d1(Data), .Mux_o(WD3));
	//mux4to1 Data_WD (.sel(MemtoReg), .d0(ALUOut), .d1(Data), .d2({24'b0, GPIO_i}), .d3(0), .Mux_o(WD3));
	
	registerfile a1_a1 (.clk(clk), .reset(reset), .Reg_Write_i(RegWrite), .Read_Register_1_i(Instr[25:21]), .Read_Register_2_i(Instr[20:16]), .Write_Register_i(A3), .Write_Data_i(WD3), .Read_Data_1_o(RD1), .Read_Data_2_o(RD2));
	
	register register_A (.clk(clk), .reset(reset), .enable(1'b1), .data_in(RD1), .data_out(A));
	
	register register_B (.clk(clk), .reset(reset), .enable(1'b1), .data_in(RD2), .data_out(B));
	
	signextend Signext    (.Imm(Instr[15:0]), .SignImm(sign16t32));
	
	signextend24 Signext24(.Imm(GPIO_i[7:0]), .SignImm(sign8t32));
	
	shift_left branch (.shift_i(SignImm), .shift_o(Branch_shift));
	
	mux2to1 mux_Switches (.sel(gpio_i), .d0(sign16t32), .d1(sign8t32), .Mux_o(SignImm));
	
	mux2to1 mux_ALUSrca (.sel(ALUSrcA), .d0(PC), .d1(A), .Mux_o(SrcA));
	
	mux4to1 Mux_ALUSrcb (.sel(ALUSrcB), .d0(B), .d1(4), .d2(SignImm), .d3(Branch_shift), .Mux_o(SrcB));
		
	ALU M_ALU (.a(SrcA), .b(SrcB), .select(ALUControl), .y(ALUResult));
	
	register Register_Alu (.clk(clk), .reset(reset), .enable(1'b1), .data_in(ALUResult), .data_out(ALUOut));
	
	shift_left #(.DataWidth(28)) jump (.shift_i({2'b00, Instr[25:0]}), .shift_o(Jump_shift));
	
	//mux2to1 mux_PC_next (.sel(PCSrc), .d0(ALUResult), .d1(ALUOut), .Mux_o(PC_next));
	//we keep BJ version
	mux4to1 mux_PC_next (.sel(PCSrc), .d0(ALUResult), .d1(ALUOut), .d2({4'b0,Jump_shift}), .d3(0), .Mux_o(PC_next));
	
	assign Op = Instr[31:26];
	assign Funct = Instr [5:0];
	assign GPIO_o = ALUResult [7:0];
	assign Zero = !ALUResult;
	
endmodule 