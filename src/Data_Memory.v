module Data_Memory
#(
	parameter MEMORY_DEPTH = 64,
	parameter DATA_WIDTH = 32
)
(
	input 								 clk,
	input 								 Enable,
	input       [(DATA_WIDTH-1):0] Write_Data, 
	input 		[(DATA_WIDTH-1):0] Address_i,
	output		[(DATA_WIDTH-1):0] Read_Data
);


	reg [DATA_WIDTH-1:0] ram [MEMORY_DEPTH-1:0];
	reg [DATA_WIDTH-1:0] Add_reg; 
	
	assign Read_Data = ram[Add_reg];
	
	always @ (posedge clk) begin
		if (Enable)
		ram[Address_i] <= Write_Data;
		Add_reg <= Address_i;
	end

endmodule 