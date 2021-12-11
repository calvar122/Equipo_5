module Control_Unit
(
	//inputs
	input        clk,
	input        reset,
	
	input	 [5:0] Op,
	input	 [5:0] Funct,
	

	// Control signals
	output reg 		   PC_Write,
	output reg 			I_or_D,
	output reg 			Mem_Write,
	output reg 			IR_Write,
	output reg 			Reg_Dst,
	output reg 			Mem_to_Reg,
	output reg 			Reg_Write,
	output reg 			ALU_Src_A,
	output reg	[1:0]	ALU_Src_B,
	output reg	[2:0]	ALU_Control,
	output reg 			PC_Src
);

	parameter
				IF    = 4'b0000,
				ID    = 4'b0001,
				IE_I  = 4'b0010,
				IE_R  = 4'b0011,
				IWB_I = 4'b0100,
				IWB_R = 4'b0101;
	
	
	reg [3:0] current_s, next_s;
	
	
  
  always @ (posedge clk) begin
    if (!reset)
      	current_s <= IF;
    else 
      current_s <= next_s;
  end
	

always @(*) begin
	case (current_s) 
	IF:  begin
				PC_Write= 1;
				I_or_D = 0;
				Mem_Write = 0;
				IR_Write = 1;
				Reg_Dst = 1'b0; //it was x
				Mem_to_Reg = 1'b0;//it was
				Reg_Write =0;
				ALU_Src_A = 0;
				ALU_Src_B = 2'b01;
				ALU_Control  = 3'b010;	//a+b
				PC_Src = 0;
			
		next_s = ID;
			end
			
	ID:   begin
				PC_Write = 0;
				I_or_D = 1'b0; // //itwas x
				Mem_Write = 0;
				IR_Write = 0; //it was 1
				Reg_Dst = 1'b0;// //it was x
				Mem_to_Reg = 1'b0;// //it was x
				Reg_Write =0;
				ALU_Src_A = 1'b1;// //it was x
				ALU_Src_B = 2'b10;// //it was xx
				ALU_Control  = 3'b010;	// //it was xxx
				PC_Src = 1'b0; // it was x
		if (Op != 0)
			next_s <= IE_I;
		else 
			next_s <= IE_R; 
               end
		
	IE_I:  begin
				PC_Write = 0; //
				I_or_D = 1'b0; //it was x
				Mem_Write = 0; //
				IR_Write = 0; //
				Reg_Dst = 1'b0;// it was x
				Mem_to_Reg = 1'b0;// it was x
				Reg_Write =0;//
				ALU_Src_A = 1;
				ALU_Src_B = 2'b10;
				ALU_Control= 3'b010;
				PC_Src = 1'b0; //it was x
			next_s = IWB_I;
		  end
		  
	IE_R:  begin
				PC_Write = 0; //
				I_or_D = 1'b0; // it was x
				Mem_Write = 0; //
				IR_Write = 0; //
				Reg_Dst = 1'b0;// it was x
				Mem_to_Reg = 1'b0;//it was x
				Reg_Write =0;//				
	         ALU_Src_A = 1;
				ALU_Src_B = 2'b00;
				ALU_Control= 3'b010; //a+b
				PC_Src = 1'b0; // it was x
			next_s = IWB_R;
			end
	IWB_I: begin
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
			next_s = IF;
			end
	IWB_R:  begin
				PC_Write = 0; //
				I_or_D = 1'b0; // it was x
				Mem_Write = 0; //
				IR_Write = 0; //				
				Reg_Dst = 1;	//it was 0
            Mem_to_Reg = 0;
            Reg_Write = 1;
				ALU_Src_A = 1'b1;// it was x
				ALU_Src_B = 2'b00;//it was xx
				ALU_Control= 3'b010;//it was xxx
				PC_Src = 1'b0; //it was x
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