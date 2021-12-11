module registerfile 
#(
	parameter N = 32
)
(
	input clk,
	input reset,
	input 		 Reg_Write_i,
	input  [4:0] Write_Register_i,
	input  [4:0] Read_Register_1_i,
	input  [4:0] Read_Register_2_i,
	input  [N-1:0] Write_Data_i,
	output [N-1:0] Read_Data_1_o,
	output [N-1:0] Read_Data_2_o
	

);

	wire [N-1:0] Decoder_Out;
	wire [N-1:0] Q [N-1:0];
	
	
	
	decoder dc (.Write_Register_i(Write_Register_i), .Decoder_Out(Decoder_Out));
	
	register register_$zero(.clk(clk), .reset(reset), .enable(Decoder_Out[0] & Reg_Write_i), .data_in(0), .data_out(Q[0]));
	
	register register_$at(.clk(clk), .reset(reset), .enable(Decoder_Out[1] & Reg_Write_i), .data_in(Write_Data_i), .data_out(Q[1]));
	
	register register_$v0(.clk(clk), .reset(reset), .enable(Decoder_Out[2] & Reg_Write_i), .data_in(Write_Data_i), .data_out(Q[2]));
	
	register register_$v1(.clk(clk), .reset(reset), .enable(Decoder_Out[3] & Reg_Write_i), .data_in(Write_Data_i), .data_out(Q[3]));
	
	register register_$a0(.clk(clk), .reset(reset), .enable(Decoder_Out[4] & Reg_Write_i), .data_in(Write_Data_i), .data_out(Q[4]));
	
	register register_$a1(.clk(clk), .reset(reset), .enable(Decoder_Out[5] & Reg_Write_i), .data_in(Write_Data_i), .data_out(Q[5]));
	
	register register_$a2(.clk(clk), .reset(reset), .enable(Decoder_Out[6] & Reg_Write_i), .data_in(Write_Data_i), .data_out(Q[6]));
	
	register register_$a3(.clk(clk), .reset(reset), .enable(Decoder_Out[7] & Reg_Write_i), .data_in(Write_Data_i), .data_out(Q[7]));
	
	register register_$t0(.clk(clk), .reset(reset), .enable(Decoder_Out[8] & Reg_Write_i), .data_in(Write_Data_i), .data_out(Q[8]));
	
	register register_$t1(.clk(clk), .reset(reset), .enable(Decoder_Out[9] & Reg_Write_i), .data_in(Write_Data_i), .data_out(Q[9]));
	
	register register_$t2(.clk(clk), .reset(reset), .enable(Decoder_Out[10] & Reg_Write_i), .data_in(Write_Data_i), .data_out(Q[10]));
	
	register register_$t3(.clk(clk), .reset(reset), .enable(Decoder_Out[11] & Reg_Write_i), .data_in(Write_Data_i), .data_out(Q[11]));
	
	register register_$t4(.clk(clk), .reset(reset), .enable(Decoder_Out[12] & Reg_Write_i), .data_in(Write_Data_i), .data_out(Q[12]));
	
	register register_$t5(.clk(clk), .reset(reset), .enable(Decoder_Out[13] & Reg_Write_i), .data_in(Write_Data_i), .data_out(Q[13]));
	
	register register_$t6(.clk(clk), .reset(reset), .enable(Decoder_Out[14] & Reg_Write_i), .data_in(Write_Data_i), .data_out(Q[14]));
	
	register register_$t7(.clk(clk), .reset(reset), .enable(Decoder_Out[15] & Reg_Write_i), .data_in(Write_Data_i), .data_out(Q[15]));
	
	register register_$s0(.clk(clk), .reset(reset), .enable(Decoder_Out[16] & Reg_Write_i), .data_in(Write_Data_i), .data_out(Q[16]));
	
	register register_$s1(.clk(clk), .reset(reset), .enable(Decoder_Out[17] & Reg_Write_i), .data_in(Write_Data_i), .data_out(Q[17]));
	
	register register_$s2(.clk(clk), .reset(reset), .enable(Decoder_Out[18] & Reg_Write_i), .data_in(Write_Data_i), .data_out(Q[18]));
	
	register register_$s3(.clk(clk), .reset(reset), .enable(Decoder_Out[19] & Reg_Write_i), .data_in(Write_Data_i), .data_out(Q[19]));
	
	register register_$s4(.clk(clk), .reset(reset), .enable(Decoder_Out[20] & Reg_Write_i), .data_in(Write_Data_i), .data_out(Q[20]));
	
	register register_$s5(.clk(clk), .reset(reset), .enable(Decoder_Out[21] & Reg_Write_i), .data_in(Write_Data_i), .data_out(Q[21]));
	
	register register_$s6(.clk(clk), .reset(reset), .enable(Decoder_Out[22] & Reg_Write_i), .data_in(Write_Data_i), .data_out(Q[22]));
	
	register register_$s7(.clk(clk), .reset(reset), .enable(Decoder_Out[23] & Reg_Write_i), .data_in(Write_Data_i), .data_out(Q[23]));
	
	register register_$t8(.clk(clk), .reset(reset), .enable(Decoder_Out[24] & Reg_Write_i), .data_in(Write_Data_i), .data_out(Q[24]));
	
	register register_$t9(.clk(clk), .reset(reset), .enable(Decoder_Out[25] & Reg_Write_i), .data_in(Write_Data_i), .data_out(Q[25]));
	
	register register_$k0(.clk(clk), .reset(reset), .enable(Decoder_Out[26] & Reg_Write_i), .data_in(Write_Data_i), .data_out(Q[26]));
	
	register register_$k1(.clk(clk), .reset(reset), .enable(Decoder_Out[27] & Reg_Write_i), .data_in(Write_Data_i), .data_out(Q[27]));
	
	register register_$gp(.clk(clk), .reset(reset), .enable(Decoder_Out[28] & Reg_Write_i), .data_in(Write_Data_i), .data_out(Q[28]));
	
	register register_$sp(.clk(clk), .reset(reset), .enable(Decoder_Out[29] & Reg_Write_i), .data_in(Write_Data_i), .data_out(Q[29]));
	
	register register_$fp(.clk(clk), .reset(reset), .enable(Decoder_Out[30] & Reg_Write_i), .data_in(Write_Data_i), .data_out(Q[30]));
	
	register register_$ra(.clk(clk), .reset(reset), .enable(Decoder_Out[31] & Reg_Write_i), .data_in(Write_Data_i), .data_out(Q[31]));
	
	
	/*genvar i;
	generate
	for (i=1; i<N; i=i+1) 
	begin: Reg 
	
	register Reg(.clk(clk), .reset(reset), .enable(Decoder_Out[i] & Reg_Write_i), .data_in(Write_Data_i), .data_out(Q[i]));
	end
	endgenerate */
	
	
	
	mux MUX1 (
	 .d0(Q[0]),
	 .d1(Q[1]),
	 .d2(Q[2]),
	 .d3(Q[3]),
	 .d4(Q[4]),
	 .d5(Q[5]),
	 .d6(Q[6]),
	 .d7(Q[7]),
	 .d8(Q[8]),
	 .d9(Q[9]),
	 .d10(Q[10]),
	 .d11(Q[11]),
	 .d12(Q[12]),
	 .d13(Q[13]),
	 .d14(Q[14]),
	 .d15(Q[15]),
	 .d16(Q[16]),
	 .d17(Q[17]),
	 .d18(Q[18]),
	 .d19(Q[19]),
	 .d20(Q[20]),
	 .d21(Q[21]),
	 .d22(Q[22]),
	 .d23(Q[23]),
	 .d24(Q[24]),
	 .d25(Q[25]),
	 .d26(Q[26]),
	 .d27(Q[27]),
	 .d28(Q[28]),
	 .d29(Q[29]),
	 .d30(Q[30]),
	 .d31(Q[31]),
	 .Read_Register(Read_Register_1_i),
	 .Read_Data(Read_Data_1_o));
	 
	 
	
mux MUX2 (
	 .d0(Q[0]),
	 .d1(Q[1]),
	 .d2(Q[2]),
	 .d3(Q[3]),
	 .d4(Q[4]),
	 .d5(Q[5]),
	 .d6(Q[6]),
	 .d7(Q[7]),
	 .d8(Q[8]),
	 .d9(Q[9]),
	 .d10(Q[10]),
	 .d11(Q[11]),
	 .d12(Q[12]),
	 .d13(Q[13]),
	 .d14(Q[14]),
	 .d15(Q[15]),
	 .d16(Q[16]),
	 .d17(Q[17]),
	 .d18(Q[18]),
	 .d19(Q[19]),
	 .d20(Q[20]),
	 .d21(Q[21]),
	 .d22(Q[22]),
	 .d23(Q[23]),
	 .d24(Q[24]),
	 .d25(Q[25]),
	 .d26(Q[26]),
	 .d27(Q[27]),
	 .d28(Q[28]),
	 .d29(Q[29]),
	 .d30(Q[30]),
	 .d31(Q[31]),
	 .Read_Register(Read_Register_2_i),
	 .Read_Data(Read_Data_2_o));
	 
	 
endmodule
	
	
	
	
	

