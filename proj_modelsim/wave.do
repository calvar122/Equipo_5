onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /TB_mips/clk_tb
add wave -noupdate /TB_mips/reset_tb
add wave -noupdate -group CU /TB_mips/DUV/CU/PC_Write
add wave -noupdate -group CU /TB_mips/DUV/CU/Branch
add wave -noupdate -group CU /TB_mips/DUV/CU/PC_En
add wave -noupdate -group CU /TB_mips/DUV/PCSrc_w
add wave -noupdate -group CU /TB_mips/DUV/ALUControl_w
add wave -noupdate -group CU /TB_mips/DUV/ALUSrcB_w
add wave -noupdate -group CU /TB_mips/DUV/ALUSrcA_w
add wave -noupdate -group CU /TB_mips/DUV/RegWrite_w
add wave -noupdate -group CU /TB_mips/DUV/CU/GPIO_I
add wave -noupdate -group CU /TB_mips/DUV/MemReg_w
add wave -noupdate -group CU /TB_mips/DUV/RegDst_w
add wave -noupdate -group CU /TB_mips/DUV/IRWrite_w
add wave -noupdate -group CU /TB_mips/DUV/MemWrite_w
add wave -noupdate -group CU /TB_mips/DUV/IorD_w
add wave -noupdate -group CU_i /TB_mips/DUV/DP/Op
add wave -noupdate -group CU_i /TB_mips/DUV/DP/Funct
add wave -noupdate -group CU_i /TB_mips/DUV/CU/Zero
add wave -noupdate -group PC -radix hexadecimal /TB_mips/DUV/DP/DUV/register_PC/data_in
add wave -noupdate -group PC -radix hexadecimal /TB_mips/DUV/DP/DUV/register_PC/data_out
add wave -noupdate -group PC /TB_mips/DUV/DP/DUV/register_PC/enable
add wave -noupdate -expand -group Memory -label MemWrite /TB_mips/DUV/DP/DUV/Memory/Enable
add wave -noupdate -expand -group Memory -radix hexadecimal /TB_mips/DUV/DP/DUV/Memory/Address_i
add wave -noupdate -expand -group Memory -radix hexadecimal /TB_mips/DUV/DP/DUV/Memory/Write_Data
add wave -noupdate -expand -group Memory -radix hexadecimal /TB_mips/DUV/DP/DUV/Memory/Instruction_o
add wave -noupdate -color Cyan /TB_mips/DUV/CU/current_s
add wave -noupdate -expand -group RegisterFile -label A1(RdRg1) -radix binary /TB_mips/DUV/DP/DUV/a1_a1/Read_Register_1_i
add wave -noupdate -expand -group RegisterFile -label A2(RdRg2) -radix binary /TB_mips/DUV/DP/DUV/a1_a1/Read_Register_2_i
add wave -noupdate -expand -group RegisterFile -color {Dark Orchid} -label A3(WrRg) -radix unsigned /TB_mips/DUV/DP/DUV/a1_a1/Write_Register_i
add wave -noupdate -expand -group RegisterFile -color {Blue Violet} -label WD3 -radix hexadecimal /TB_mips/DUV/DP/DUV/a1_a1/Write_Data_i
add wave -noupdate -expand -group RegisterFile -label RD1 -radix hexadecimal /TB_mips/DUV/DP/DUV/a1_a1/Read_Data_1_o
add wave -noupdate -expand -group RegisterFile -label RD2 -radix hexadecimal /TB_mips/DUV/DP/DUV/a1_a1/Read_Data_2_o
add wave -noupdate -expand -group RegisterFile -color {Blue Violet} /TB_mips/DUV/DP/DUV/a1_a1/Reg_Write_i
add wave -noupdate -radix hexadecimal /TB_mips/DUV/DP/DUV/Data
add wave -noupdate -radix hexadecimal /TB_mips/DUV/DP/DUV/Memory/RAM_M/Add_reg
add wave -noupdate -group Intermedite -label PC_o -radix hexadecimal /TB_mips/DUV/DP/DUV/register_PC/data_out
add wave -noupdate -group Intermedite -label RegInstr_o -radix hexadecimal /TB_mips/DUV/DP/DUV/register_instruc/data_out
add wave -noupdate -group Intermedite -label RF_i -radix hexadecimal /TB_mips/DUV/DP/DUV/WD3
add wave -noupdate -expand -group ALU /TB_mips/DUV/ALUControl_w
add wave -noupdate -expand -group ALU -label ALU_SrcA_i -radix hexadecimal /TB_mips/DUV/DP/DUV/M_ALU/a
add wave -noupdate -expand -group ALU -label ALU_SrcB_i -radix hexadecimal /TB_mips/DUV/DP/DUV/M_ALU/b
add wave -noupdate -expand -group ALU -color {Spring Green} -label ALU_o -radix hexadecimal /TB_mips/DUV/DP/DUV/M_ALU/y
add wave -noupdate -color Yellow /TB_mips/GPIO_i_tb
add wave -noupdate -color Yellow -label GPIO_o_tb(R) -radix binary /TB_mips/GPIO_o_tb
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {139 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {126 ps} {158 ps}
