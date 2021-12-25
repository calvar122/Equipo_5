//TB mips
module TB_mips;
	reg       clk_tb = 1;
	reg       reset_tb;
	reg		[7:0] GPIO_i_tb;
	wire 		[7:0] GPIO_o_tb;
	
	mips DUV(
					.clk_i(clk_tb),
					.reset_i(reset_tb),
					.GPIO_i(GPIO_i_tb),
					.GPIO_o(GPIO_o_tb)
	);
	
initial begin						
forever #1 clk_tb = ~clk_tb; 
end

initial	begin 
#0 reset_tb = 0; 
#0 GPIO_i_tb = 8'b0000_0011; //inyecto 0 simulando el switch input
#3 reset_tb = 1;


end

endmodule
 