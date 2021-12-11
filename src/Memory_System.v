module Memory_System
#(
	parameter MEMORY_DEPTH = 64,
	parameter DATA_WIDTH = 32
)
(
	input 								 clk,
	input 								 Enable,
	input       [(DATA_WIDTH-1):0] Write_Data, 
	input 		[(DATA_WIDTH-1):0] Address_i,
	output		[(DATA_WIDTH-1):0] Instruction_o
);

	wire 			[(DATA_WIDTH-1):0] rom_o;
	wire 			[(DATA_WIDTH-1):0] ram_o;
	
	mux2to1 Mux_M(.sel(Address_i>=32'h10010000), .d0(rom_o), .d1(ram_o), .Mux_o(Instruction_o));
	
	Program_Memory ROM_M(.Address_i((Address_i-32'h400000)>>2), .Instruction_o(rom_o)); 
	
	Data_Memory RAM_M(.clk(clk), .Enable(Enable), .Write_Data(Write_Data), .Address_i((Address_i-32'h10010000)>>2), . Read_Data(ram_o));
	
endmodule 
