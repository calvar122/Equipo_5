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
	output reg 	[1:0] Reg_Dst,
	output reg 			Mem_to_Reg,		//JB [1:0] i supose for sw
	output reg 			Reg_Write,
	output reg 			ALU_Src_A,
	output reg	[1:0]	ALU_Src_B,
	output reg	[2:0]	ALU_Control,
	output reg 	[1:0]	PC_Src,			//JB[1:0]
	output reg 	[1:0]	GPIO_I,			//SW
	output reg 			final
);
	//Parameters
	parameter
				IF    	= 	5'b00000,
				ID    	= 	5'b00001,
				IE_I  	= 	5'b00010,
				IE_R  	= 	5'b00011,
				IE_B  	=  5'b00100,			//JB
				IE_J  	=  5'b00101,			//JB
				IE_Iaddiu=	5'b00110,			//SWitch
				IE_Ilui	=	5'b00111,
				LW_MR 	=  5'b01000,
				SW_MW 	=  5'b01001,
				IM_ADR	=  5'b01010,
				LW_MWB 	=  5'b01011,
				
				IWB_I 	= 	5'b01100,
				IWB_R 	= 	5'b01101,
				IE_jal	=	5'b01110,
				IW_jal	= 	5'b01111,
				I_SLTI	=	5'b10000,
				JR			=	5'b10001,
				MUL      =  5'b10010,
				IWB_2    =  5'b10011,
				LW_MWB2	=	5'b10100;
			   
								 
				 
	
	//FSM variables
	reg [4:0] current_s, next_s;
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
always @(Op or Funct or current_s) 
	begin:Initial_S
		next_s 		= 5'b00000;
		PC_Write		= 0;
		Mem_Write	= 0;
		I_or_D 		= 0;
		IR_Write 	= 0;
		PC_Src 		= 2'b00;
		Branch		= 0;
		ALU_Control = 3'b000;	//a
		ALU_Src_A 	= 0;
		ALU_Src_B 	= 2'b00;
		Reg_Write 	= 0;
		Mem_to_Reg 	= 1'b0;
		Reg_Dst 		= 2'b00;
		GPIO_I 		= 2'b00;
		final			= 1'b0;
		
	case (current_s) 
		IF:  begin
					//---Mandatory
					PC_Write= 1;
					IR_Write = 1;
					PC_Src = 2'b00;
					ALU_Control  = 3'b010;	//a+b
					ALU_Src_A = 0;
					ALU_Src_B = 2'b01;
					//---For no latch
					Mem_Write = 0;
					I_or_D = 0;
					Branch = 1'b0;
					Reg_Write =0;
					Mem_to_Reg = 1'b0;
					Reg_Dst = 2'b00; 	
					GPIO_I = 2'b01;		//SW
					final			= 1'b0;

					next_s = ID;
				end
			
		ID:  begin
					//---Mandatory
					//ICH
					/*ALU_Src_A = 1'b1;			
					ALU_Src_B = 2'b10;		
					ALU_Control  = 3'b010;	//a+b
					*/
					
					//book
					ALU_Src_A = 1'b0;			
					ALU_Src_B = 2'b11;		
					ALU_Control  = 3'b010;
					//---No Latch
					PC_Write = 0;
					IR_Write = 0;
					PC_Src = 2'b00;
					Branch = 1'b0;
					Mem_Write = 0;
					Reg_Write =0;										
					I_or_D = 1'b0; 			
					Reg_Dst = 2'b00;			
					Mem_to_Reg = 1'b0;										
					GPIO_I = 2'b01;	//			<--SW
					final			= 1'b0;

				if(Op == 6'b000000)			//no opcode, then is R format
					if(Funct == 6'b011000)
					next_s = MUL;
					else  
					next_s = IE_R;	
				else if (Op == 6'b000100)	//op=4, then is branch I format
					next_s = IE_B;		
				else if (Op == 6'b000010)	//op=2, then is jump J format
					next_s = IE_J;		
				else if (Op == 6'b001001)	//op=9, then is addiu I format (hacked for switches)
					next_s = IE_Iaddiu; 
				else if (Op == 6'b001111)	//op=15, then is lui I format
					next_s = IE_Ilui;
				else if (Op == 6'b000011)	//op=3, then is jal J format
					next_s = IE_jal;
				else if (Op == 6'b100011 || Op == 6'b101011) //op=2b||23, then is sw||lw I format
					next_s = IM_ADR;
				//else if (Op) 
				else
					next_s = IE_I;		//I instruction execution Aqui entra lui
			
          end
		
	IE_I:  begin
				ALU_Src_A = 1;				
				ALU_Src_B = 2'b10;		//JB it was 00 but i think in I is 10
				ALU_Control= 3'b010;
				
				PC_Write = 0;				//JB no
				I_or_D = 1'b0;				//JB no
				Mem_Write = 0;				//JB no
				IR_Write = 0;				//JB no
				Reg_Dst = 2'b00;			//JB no
				Mem_to_Reg = 1'b0;		//JB no
				Reg_Write =0;				//JB no
				PC_Src = 2'b00;				//JB no
				
				GPIO_I = 2'b01;	//			<--SW
				final			= 1'b0;
				if (Op == 6'b001010)	//op=a, then is slti	I formar
				ALU_Control= 3'b011;	//a<b
				final			= 1'b0;
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
			Reg_Dst = 2'b00;			//JB no
			Mem_to_Reg = 1'b0;		//JB no
			Reg_Write =0;				//JB no		
			PC_Src = 2'b00;				//JB no
			
			GPIO_I = 2'b01;//			<--SW
			final			= 1'b0;
			if(Funct == 6'b001000)
			next_s = JR;
			else 
			next_s = IWB_R;
		end
		
		IE_B:  begin
			
			ALU_Src_A = 1;
			ALU_Src_B = 2'b00;
			ALU_Control= 3'b001; //a-b
			PC_Src = 2'b01;				
			Branch = 1;
			GPIO_I = 2'b01;	//<--SWICTH	lnospec
	
			//----NO LATCH
			//PC_Write = 1;//cale
			PC_Write = 0;
			Mem_Write = 0;			
			I_or_D = 1'b0;						
			IR_Write = 0;				
			Reg_Dst = 2'b00;			
			Mem_to_Reg = 1'b0;		
			Reg_Write =0;						
			final			= 1'b0;
			
		next_s = IF;
		end
		
		IE_jal:	begin
			ALU_Src_A = 0;
			ALU_Src_B = 2'b10;//was 01
			ALU_Control= 3'b000;//a
			Mem_to_Reg = 1'b0;
			Reg_Dst  = 2'b00;
			GPIO_I = 2'b01;	//			<--SW	
			//no latch
			PC_Write = 0;
			Mem_Write = 0;	
			I_or_D = 1'b0;
			IR_Write = 0;
			PC_Src = 2'b00;	//lis1
			Branch = 1'b0;
			Reg_Write = 0;
			final			= 1'b0;
			next_s = IW_jal;
			
		end
		MUL:  begin 
		   ALU_Src_A = 1;
			ALU_Src_B = 2'b00;
			ALU_Control= 3'b110; //a*b	in JB was 001 a-b i supose confution wit zero
		
			PC_Write = 0;				//JB no
			I_or_D = 1'b0;				//JB no
			Mem_Write = 0;				//JB no
			IR_Write = 0;				//JB no
			Reg_Dst = 2'b00;			//JB no
			Mem_to_Reg = 1'b0;		//JB no
			Reg_Write =0;				//JB no		
			PC_Src = 2'b00;				//JB no
			next_s = IWB_R;
			final			= 1'b0;
			
			end 
			

		IW_jal: begin
			Mem_to_Reg = 1'b0;
			Reg_Dst  = 2'b10;
			Reg_Write = 1;		//escribir en el register file
			ALU_Control= 3'b000;//a, was 001 a-b
			ALU_Src_A = 0;
			ALU_Src_B = 2'b01;//was 10
			GPIO_I = 2'b01;	//			<--SW
			//no latch
			PC_Write = 0;
			Mem_Write = 0;	
			I_or_D = 1'b0;
			IR_Write = 0;
			PC_Src = 2'b00;	//lis1
			Branch = 1'b0;
			final			= 1'b0;
			next_s = IE_J;
		end
		
		IE_J:  begin
			PC_Write = 1;
			Reg_Write = 0;	//dejar de escribir
			PC_Src = 2'b10;	//lis1	
			GPIO_I = 2'b01;	//			<--SW			
			//no latch
			Mem_Write = 0;	
			I_or_D = 1'b0;
			IR_Write = 0;	
			Branch = 1'b0;
			Reg_Write =0;
			Mem_to_Reg = 1'b0;
			Reg_Dst = 2'b00;
			final			= 1'b0;
			/*
			ALU_Src_A = 0;
			ALU_Src_B = 2'b11;
			ALU_Control= 3'111; //32'b0
			*/									
			
		next_s = IF;
		end
		
		
		IE_Iaddiu:  begin
				Reg_Dst = 2'b00;			//in JB is 1
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
				GPIO_I = 2'b10;	//			<--SW
				final			= 1'b0;
			next_s = IWB_I;
		  end
		  
		  IE_Ilui:  begin
				Reg_Dst = 2'b00;			//in JB is 1
				Mem_to_Reg = 1'b0;		//in JB is 10
				Reg_Write =0;				//in JB is 1
				ALU_Src_A = 1;
				ALU_Src_B = 2'b10;
				ALU_Control= 3'b010;	//a+b
				GPIO_I = 2'b00;			//16'b0,imm
				
				PC_Write = 0; 
				I_or_D = 1'b0; 
				Mem_Write = 0; 
				IR_Write = 0; 



				PC_Src = 2'b00; 
				final			= 1'b0;
	//			<--SW
			next_s = IWB_I;
		  end
		  				
		
	IM_ADR: begin
				PC_Write = 0;//L
				Mem_Write = 0;//L
				I_or_D = 1'b1;//L
				IR_Write = 0;//L
				PC_Src = 2'b00;//L is 10 (J)
				Branch = 0;//L
				ALU_Control= 3'b010;//a+b
				ALU_Src_A = 1'b1;			
				ALU_Src_B = 2'b10;	
				Reg_Write = 0;
				Mem_to_Reg = 0;
				Reg_Dst = 2'b00;	//in JB is 1
				GPIO_I = 2'b01;	//			<--SW	
				final			= 1'b0;
				if(Op == 6'b100011)//(LW)
					next_s = LW_MR;
				else if (Op == 6'b101011)//(SW)
					next_s = SW_MW;
				else 
					next_s = IF;	//nunca aplica pero xd
			end 
	LW_MR: begin
				PC_Write = 0;//L
				Mem_Write = 0;//l
				I_or_D = 1'b1;//l
				IR_Write = 0;//L
				PC_Src = 2'b00;//L is 10 (J)
				Branch = 0;//L
				ALU_Control= 3'b010;//a+b
				ALU_Src_A = 1'b1;		//l	
				ALU_Src_B = 2'b10;//l	
				Reg_Write = 0;//l
				Mem_to_Reg = 1;
				Reg_Dst = 2'b00;
				GPIO_I = 2'b01;	//			<--SW	
				final			= 1'b0;
				next_s = LW_MWB;
			end
	LW_MWB: begin 	
				PC_Write = 0;//L
				Mem_Write = 0;//l
				I_or_D = 1'b1;//cale
				IR_Write = 0;//L
				PC_Src = 2'b00;//L is 10 (J)
				Branch = 0;//L
				Reg_Write = 1;
				Mem_to_Reg = 1;
				ALU_Control= 3'b010;//a+b
				ALU_Src_A = 1'b1;		//l	
				ALU_Src_B = 2'b10;//l					
				Reg_Dst = 2'b00;
				GPIO_I = 2'b01;	//			<--SW	
				final			= 1'b0;
				next_s = LW_MWB2;
			end
		LW_MWB2: begin 	
				PC_Write = 0;//L
				Mem_Write = 0;//l
				I_or_D = 1'b1;//cale
				IR_Write = 0;//L
				PC_Src = 2'b00;//L is 10 (J)
				Branch = 0;//L
				Reg_Write = 1;
				Mem_to_Reg = 1;
				ALU_Control= 3'b010;//a+b
				ALU_Src_A = 1'b1;		//l	
				ALU_Src_B = 2'b10;//l					
				Reg_Dst = 2'b00;
				GPIO_I = 2'b01;	//			<--SW
				final			= 1'b0;
				next_s = IF;
			end
	SW_MW: begin				
				PC_Write = 0;//L
				Mem_Write = 1;
				I_or_D = 1'b1;
				IR_Write = 0;//L
				PC_Src = 2'b00;//L is 10 (J)
				Branch = 0;//L
				ALU_Control= 3'b010;//a+b
				ALU_Src_A = 1'b1;		//l	
				ALU_Src_B = 2'b10;//l	
				Reg_Write = 0;//l
				Mem_to_Reg = 1;//l
				Reg_Dst = 2'b00;	//in JB is 1
				GPIO_I = 2'b01;	//			<--SW	
				final			= 1'b0;
				next_s = IF;
			end
	JR:    begin 
			   Reg_Dst = 2'b00;			//in JB is 0	
            Mem_to_Reg = 0;
            Reg_Write = 1;
				
				PC_Write = 1;				//JB no
				I_or_D = 1'b0;				//JB no
				Mem_Write = 0;				//JB no
				IR_Write = 0;				//JB no				
				ALU_Src_A = 1'b1;			//JB no
				ALU_Src_B = 2'b00;		//JB no
				ALU_Control= 3'b000;		//JB no
				PC_Src = 2'b01;				//JB no
				
				GPIO_I = 2'b00;
				final			= 1'b0;
				next_s = IF;
				end

	IWB_I: begin
	         Reg_Dst = 2'b00;	//in JB is 1	
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
				GPIO_I = 2'b01;	//			<--SW
				final			= 1'b0;
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
				Reg_Dst = 2'b01;			//in JB is 0	
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
				
				GPIO_I = 2'b01;	//			<--SW
				final			= 1'b0;
				if(Funct == 6'b100101)
					final = 1'b1;
				else
				next_s = IF;
			end

		endcase 
	end

endmodule 
