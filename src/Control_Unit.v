module Control_Unit
(
	//inputs
	input        clk,
	input        reset,
	
	input	 [5:0] Op,
	input	 [5:0] Funct,
	input        Zero,
	// Control signals
	//output reg 		   PC_Write,	//JB 
	output				PC_En,			//JB
	output reg 			I_or_D,
	output reg 			Mem_Write,
	output reg 			IR_Write,
	output reg 			Reg_Dst,
	output reg 			Mem_to_Reg,		//JB [1:0] i supose for sw
	output reg 			Reg_Write,
	output reg 			ALU_Src_A,
	output reg	[1:0]	ALU_Src_B,
	output reg	[2:0]	ALU_Control,
	output reg 	[1:0]	PC_Src,			//JB[1:0]
	output reg 			GPIO_I			//SW
);
	//Parameters
	parameter
				IF    = 	4'b0000,
				ID    = 	4'b0001,
				IE_I  = 	4'b0010,
				IE_R  = 	4'b0011,
				IE_B  =  4'b0100,			//JB
				IE_J  =  4'b0101,			//JB
				IE_Iori=	4'b0110,			//SW
				IWB_I = 	4'b0111,
				IWB_R = 	4'b1000;
				 
				//IWB_Iori=4'b0111; //<--not impact
	
	//FSM variables
	reg [3:0] current_s, next_s;
	reg PC_Write, Branch;				//JB
	
	assign PC_En = PC_Write | (Branch & Zero);	//JB
	
  //FSM next state logic
  always @ (posedge clk) begin
    if (!reset)
      	current_s <= IF;
    else 
      current_s <= next_s;
  end
	
	//FSM outputs logic
always @(*) begin
	case (current_s) 
	IF:  begin
				PC_Write= 1;
				I_or_D = 0;
				Mem_Write = 0;
				IR_Write = 1;
				Reg_Write =0;
				ALU_Src_A = 0;
				ALU_Src_B = 2'b01;
				ALU_Control  = 3'b010;	//a+b
				PC_Src = 2'b00;
				
				Reg_Dst = 1'b0; 		//JB no
				Mem_to_Reg = 1'b0;	//JB no
	
				GPIO_I = 1'b0;			//SW
			
		next_s = ID;
			end
			
	ID:   begin
				PC_Write = 0;
				Mem_Write = 0;
				IR_Write = 0;	//JB is in 1
				Reg_Write =0;
				
				
				I_or_D = 1'b0; 			//JB no
				Reg_Dst = 1'b0;			//JB no
				Mem_to_Reg = 1'b0;		//JB no
				ALU_Src_A = 1'b1;			//JB no
				ALU_Src_B = 2'b10;		//JB no
				ALU_Control  = 3'b010;	//JB no	
				PC_Src = 2'b00;				//JB no
				
				GPIO_I = 1'b0;	//			<--SW
				
		/*old selective version
		if (Op != 0)begin
			if (Op == 6'b001101)	//d hex opcode for ori
				next_s <= IE_Iori;
			else
				next_s <= IE_I;
			end
		else 
			next_s <= IE_R; */
				if(Op == 6'b000000)
					next_s = IE_R;		//R istruction execution
				else if (Op == 6'b000100)
					next_s = IE_B;		//I (Branch) instruction execution
				else if (Op == 6'b000010)
					next_s = IE_J;		//J instruction execution
				else if (Op == 6'b001101)
					next_s = IE_Iori; //I (Ori <Switches input>) instruction execution
				else
					next_s = IE_I;		//I instruction execution
			
          end
		
	IE_I:  begin
				ALU_Src_A = 1;				
				ALU_Src_B = 2'b10;		//JB it was 00 but i think in I is 10
				ALU_Control= 3'b010;
				
				PC_Write = 0;				//JB no
				I_or_D = 1'b0;				//JB no
				Mem_Write = 0;				//JB no
				IR_Write = 0;				//JB no
				Reg_Dst = 1'b0;			//JB no
				Mem_to_Reg = 1'b0;		//JB no
				Reg_Write =0;				//JB no
				PC_Src = 2'b00;				//JB no
				
				GPIO_I = 1'b0;	//			<--SW
			next_s = IWB_I;
		  end
		  
		IE_R:  begin
			ALU_Src_A = 1;
			ALU_Src_B = 2'b00;
			ALU_Control= 3'b010; //a+b	in JB was 001 a-b i supose confution wit zero
		
			PC_Write = 0;				//JB no
			I_or_D = 1'b0;				//JB no
			Mem_Write = 0;				//JB no
			IR_Write = 0;				//JB no
			Reg_Dst = 1'b0;			//JB no
			Mem_to_Reg = 1'b0;		//JB no
			Reg_Write =0;				//JB no		
			PC_Src = 2'b00;				//JB no
			
			GPIO_I = 1'b0;	//			<--SW
		next_s = IWB_R;
		end
		
		IE_B:  begin
			ALU_Src_A = 1;
			ALU_Src_B = 2'b00;
			ALU_Control= 3'b001; //a-b
			PC_Src = 2'b01;				
			Branch = 1;
			GPIO_I = 1'b0;	//			<--SW			
			
			/*
			next signals are not updated in JB
			PC_Write = 0;				
			I_or_D = 1'b0;				
			Mem_Write = 0;				
			IR_Write = 0;				
			Reg_Dst = 1'b0;			
			Mem_to_Reg = 1'b0;		
			Reg_Write =0;						
			*/
			
		next_s = IF;
		end
		
		IE_J:  begin

			PC_Src = 2'b10;	
			PC_Write = 1;
			GPIO_I = 1'b0;	//			<--SW			
			
			/*
			ALU_Src_A = 1;
			ALU_Src_B = 2'b00;
			ALU_Control= 3'b001; //a-b
			next signals are not updated in JB
			PC_Write = 0;				
			I_or_D = 1'b0;				
			Mem_Write = 0;				
			IR_Write = 0;				
			Reg_Dst = 1'b0;			
			Mem_to_Reg = 1'b0;		
			Reg_Write =0;						
			*/
			
		next_s = IF;
		end
		
		IE_Iori:  begin
				Reg_Dst = 1'b0;			//in JB is 1
				Mem_to_Reg = 1'b0;		//in JB is 10
				Reg_Write =0;				//in JB is 1
				
				PC_Write = 0; 
				I_or_D = 1'b0; 
				Mem_Write = 0; 
				IR_Write = 0; 
				ALU_Src_A = 1;
				ALU_Src_B = 2'b10;
				ALU_Control= 3'b010;
				PC_Src = 2'b00; 
				GPIO_I = 1'b1;	//			<--SW
			next_s = IWB_I;
		  end
		  


	IWB_I: begin
	         Reg_Dst = 0;	//in JB is 1	
            Mem_to_Reg = 0;
            Reg_Write = 1;
				
				PC_Write = 0;				//JB no
				I_or_D = 1'b0;				//JB no
				Mem_Write = 0;				//JB no
				IR_Write = 0;				//JB no
				ALU_Src_A = 1'b1;			//JB no
				ALU_Src_B = 2'b00;		//JB no
				ALU_Control= 3'b010;		//JB no
				PC_Src = 2'b00;				//JB no
				GPIO_I = 1'b0;	//			<--SW
			next_s = IF;
			end
	
		/*IWB_Iori: begin
				PC_Write = 0; //
				I_or_D = 1'b0; //it was x
				Mem_Write = 0; //
				IR_Write = 0; //
	         Reg_Dst = 0;	//it was 1
            Mem_to_Reg = 0;
            Reg_Write = 1;
				ALU_Src_A = 1'b1;// it was x
				ALU_Src_B = 2'b00;// it was xx
				ALU_Control= 3'b010;// it was xxx
				PC_Src = 1'b0; //it was x
				GPIO_I = 1'b1;	//			<--esto
			next_s = IF;
			end*/
	
	IWB_R:  begin
				Reg_Dst = 1;			//in JB is 0	
            Mem_to_Reg = 0;
            Reg_Write = 1;
				
				PC_Write = 0;				//JB no
				I_or_D = 1'b0;				//JB no
				Mem_Write = 0;				//JB no
				IR_Write = 0;				//JB no				
				ALU_Src_A = 1'b1;			//JB no
				ALU_Src_B = 2'b00;		//JB no
				ALU_Control= 3'b010;		//JB no
				PC_Src = 2'b00;				//JB no
				
				GPIO_I = 1'b0;	//			<--SW
			next_s = IF;
			end

		endcase 
	end
	
endmodule 

	
/*module (LEDR, LEDR0, LEDR1, LEDR2, LEDR3, LEDR4, LEDR5, LEDR6, LEDR7, SW) 

	parameter DataWidth = 32;
	
	input 

	output[7:0] LEDR, LEDR0, LEDR1, LEDR2, LEDR3, LEDR4, LEDR5, LEDR6, LEDR7;
	
	.clk(), .reset(SW[0]), .GPIO_o[0](LEDR0), .GPIO_o[1](LEDR1), .GPIO_o[2](LEDR2), ..GPIO_o[3](LEDR3), 
	..GPIO_o[4](LEDR4), .GPIO_o[5](LEDR5), .GPIO_o[6](LEDR6), ..GPIO_o[7](LEDR7);*/