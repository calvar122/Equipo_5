module register 
#(
	parameter N = 32
)
(
	input clk, reset, enable,
	input [N-1:0] data_in,
	output reg [N-1:0] data_out
);

always@ (posedge clk, negedge reset) begin
	if(!reset)
	data_out <= 0;
	else if (enable)
	data_out <= data_in;

end

endmodule

