//Wrapper mips

module wrapper_mips (MAX10_CLK1_50, SW, LEDR);
	input   MAX10_CLK1_50;
	input    [9:0]SW;
	output  [7:0] LEDR;
	//////////// LED //////////
	
	wire mclk = MAX10_CLK1_50;
	wire Clock;
	wire Resetn = SW[9];
	wire [7:0] gpio_i = SW[7:0];
	wire [7:0] gpio_o = LEDR;
	assign LEDR = gpio_o;
								//input					//input				//output
	Counter1s Clk_1s ( .mclk(mclk), .reset(Resetn), .SEGUNDO(Clock));  // Clock signal from seconds counter
	
	mips MIPS(.clk_i(Clock), .reset_i(Resetn), .GPIO_i(gpio_i), .GPIO_o(gpio_o));
	
endmodule
