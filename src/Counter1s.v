//1 second counter

module Counter1s
	(
		input mclk, reset,
		output reg SEGUNDO
		//output integer conteo,

  	);
								//25millones la mitad de 1 seg para rl mclk de 50M
  localparam CUENTA= 25000000; // local porq no buscamos modificarlo 									32'b00000001011111010111100001000000
  integer conteo;			//es el q va contar los flancos de mclk tambien es integer de 32bits 32'b00000000000000000000000000000000
  wire w1; 					//este es mi flag de 1/2 segundo 
  always@ (negedge reset, posedge mclk)
	begin
	   if (reset == 1'b0 ) conteo <= 0;
	   else
				if (conteo == CUENTA) conteo <=0; //opcion 1
				else conteo <= conteo + 1;
		end
	assign w1 = (conteo == CUENTA) ? 1'b1 : 1'b0 ; //este pulso solo durara 20nS pero lo usare de habilitador
	
	
	always@(negedge reset, posedge mclk)
	begin
		if(reset == 1'b0) SEGUNDO <= 1'b0;
		else 
			if (w1) SEGUNDO <= ~(SEGUNDO); //cada 25M debes conmutar de estado
			else    SEGUNDO <= SEGUNDO;		//si no hay flag mantienes tu valor
	end
	
	//assign RCO = w1;  // Ripple Carry Output
	
	endmodule
	