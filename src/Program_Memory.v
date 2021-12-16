
module Program_Memory
#
(
	parameter MEMORY_DEPTH = 64,
	parameter DATA_WIDTH = 32
)
(
	input [(DATA_WIDTH-1):0] Address_i,
	output reg [(DATA_WIDTH-1):0] Instruction_o
);

	reg [DATA_WIDTH-1:0] rom [MEMORY_DEPTH-1:0];

	initial
	begin
		$readmemh("C:/PROJECTS/Architecture/mips/src/T7-1.dat", rom);
	end

	always @ (Address_i)
	begin
		Instruction_o = rom[Address_i];
	end

endmodule
