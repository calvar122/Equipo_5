//1 second counter

module Counter1s
	(
		input mclk, reset,
		output reg SEGUNDO
		//output integer conteo,

  	);
			//<----1s---->
			//		   ____
			//		  |	 |
			//|_____|    |
			//<-25M->
			//<----50M--->
			
		//cuando mckl hace 50M de ciclos representa 1 segundo
		//Se habilitara una bandera cada 25M de ciclos para q nos conmute una senal
		// esta senal representara cada periodo del reloj de 1 seg
	//localparam CUENTA= 25000000; //hasta donde quiero contar	
  //localparam CUENTA= 5000; //hasta donde quiero contar(1seg con pll)
  localparam CUENTA = 500;	//acelera x10 el resultado final
  
  integer conteo;			//es el q va contar los flancos de mclk
  wire w1; 					//este es mi flag de 1/2 segundo 
  
  always@ (negedge reset, posedge mclk)
	begin
	   if (reset == 1'b0 ) conteo <= 0;		//reset
	   else
				if (conteo == CUENTA) conteo <=0; //cuando llege a 25M se resetea cuenta
				else conteo <= conteo + 1;			//si no sigue contando
		end
	assign w1 = (conteo == CUENTA) ? 1'b1 : 1'b0 ; //esta es mi bandera de 1/2 seg
	
	
	always@(negedge reset, posedge mclk)
	begin
		if(reset == 1'b0) SEGUNDO <= 1'b0;	//reset
		else 
			if (w1) SEGUNDO <= ~(SEGUNDO); //cada 1/2 seg debes conmutar de estado
			else    SEGUNDO <= SEGUNDO;		//si no hay flag mantienes tu valor
	end
	
	//assign RCO = w1;  // Ripple Carry Output
	
	endmodule
	