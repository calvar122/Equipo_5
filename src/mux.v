module mux 
#(
	parameter N = 32
)
(
	input		  [N-1:0] d0,
	input		  [N-1:0] d1,
	input		  [N-1:0] d2,
	input		  [N-1:0] d3,
	input		  [N-1:0] d4,
	input		  [N-1:0] d5,
	input		  [N-1:0] d6,
	input		  [N-1:0] d7,
	input		  [N-1:0] d8,
	input		  [N-1:0] d9,
	input		  [N-1:0] d10,
	input		  [N-1:0] d11,
	input		  [N-1:0] d12,
	input		  [N-1:0] d13,
	input		  [N-1:0] d14,
	input		  [N-1:0] d15,
	input		  [N-1:0] d16,
	input		  [N-1:0] d17,
	input		  [N-1:0] d18,
	input		  [N-1:0] d19,
	input		  [N-1:0] d20,
	input		  [N-1:0] d21,
	input		  [N-1:0] d22,
	input		  [N-1:0] d23,
	input		  [N-1:0] d24,
	input		  [N-1:0] d25,
	input		  [N-1:0] d26,
	input		  [N-1:0] d27,
	input		  [N-1:0] d28,
	input		  [N-1:0] d29,
	input		  [N-1:0] d30,
	input		  [N-1:0] d31,
	
	input		  [4:0] 	 Read_Register,
	
	output reg [N-1:0] Read_Data
);
	
	always@ (*) begin
	case (Read_Register)
			0	 : Read_Data = d0;
			1	 : Read_Data = d1;
			2	 : Read_Data = d2;
			3	 : Read_Data = d3;
			4	 : Read_Data = d4;
			5	 : Read_Data = d5;
	      6	 : Read_Data = d6;
			7	 : Read_Data = d7;
			8	 : Read_Data = d8;
			9	 : Read_Data = d9;
			10	 : Read_Data = d10;
			11	 : Read_Data = d11;
			12	 : Read_Data = d12;
			13	 : Read_Data = d13;
			14	 : Read_Data = d14;
			15	 : Read_Data = d15;
			16	 : Read_Data = d16;
			17	 : Read_Data = d17;
			18	 : Read_Data = d18;
			19	 : Read_Data = d19;
			20	 : Read_Data = d20;
			21	 : Read_Data = d21;
			22	 : Read_Data = d22;
			23	 : Read_Data = d23;
			24	 : Read_Data = d24;
			25	 : Read_Data = d25;
			26	 : Read_Data = d26;
			27	 : Read_Data = d27;
			28	 : Read_Data = d28;
			29	 : Read_Data = d29;
			30	 : Read_Data = d30;
			31	 : Read_Data = d31;
endcase
end
endmodule

			
		
	






	
	
	
	