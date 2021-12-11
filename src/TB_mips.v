//TB mips
module TB_mips;
	reg       clk_tb = 1;
	reg       reset_tb;
	
	wire 		[7:0] GPIO_tb;
	
	mips DUV(
					.clk_i(clk_tb),
					.reset_i(reset_tb),
					.GPIO(GPIO_tb)
	);
	
initial begin						
forever #1 clk_tb = ~clk_tb; 
end

initial	begin 
#0 reset_tb = 0; 
#3 reset_tb = 1; 
end

endmodule
