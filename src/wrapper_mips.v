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
	//PLL generates a controlled 1s clock
	clk_generator	clk_generator_inst (.inclk0 (mclk), .c0 (clk_gen));
								//input					//input				//output
	Counter1s Clk_1s ( .mclk(clk_gen), .reset(Resetn), .SEGUNDO(Clock));  // Clock signal from seconds counter
	
	mips MIPS(.clk_i(Clock), .reset_i(Resetn), .GPIO_i(gpio_i), .GPIO_o(gpio_o));
	
	
endmodule
