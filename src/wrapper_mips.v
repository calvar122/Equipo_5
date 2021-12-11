//Wrapper mips

module wrapper_mips (MAX10_CLK1_50, SW, LEDR);
	input   MAX10_CLK1_50;
	input    [9:9]SW;
	output  [7:0] LEDR;
	//////////// LED //////////
	
	wire mclk = MAX10_CLK1_50;
	wire Clock;
	wire Resetn = SW[9];
	wire [7:0] gpio = LEDR;
	assign LEDR = gpio;
								//input					//input				//output
	Counter1s Clk_1s ( .mclk(mclk), .reset(Resetn), .SEGUNDO(Clock));  // Clock signal from seconds counter
	
	mips MIPS(.clk_i(Clock), .reset_i(Resetn), .GPIO(gpio));
	
endmodule
