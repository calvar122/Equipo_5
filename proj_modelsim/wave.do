onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /TB_mips/clk_tb
add wave -noupdate /TB_mips/reset_tb
add wave -noupdate -expand -group CU /TB_mips/DUV/PCW_w
add wave -noupdate -expand -group CU /TB_mips/DUV/IorD_w
add wave -noupdate -expand -group CU /TB_mips/DUV/MemWrite_w
add wave -noupdate -expand -group CU /TB_mips/DUV/IRWrite_w
add wave -noupdate -expand -group CU /TB_mips/DUV/RegDst_w
add wave -noupdate -expand -group CU /TB_mips/DUV/MemReg_w
add wave -noupdate -expand -group CU /TB_mips/DUV/RegWrite_w
add wave -noupdate -expand -group CU /TB_mips/DUV/ALUSrcA_w
add wave -noupdate -expand -group CU /TB_mips/DUV/ALUSrcB_w
add wave -noupdate -expand -group CU /TB_mips/DUV/ALUControl_w
add wave -noupdate -expand -group CU /TB_mips/DUV/PCSrc_w
add wave -noupdate -expand -group CI_inputs /TB_mips/DUV/DP/Op
add wave -noupdate -expand -group CI_inputs /TB_mips/DUV/DP/Funct
add wave -noupdate -color Cyan /TB_mips/DUV/CU/current_s
add wave -noupdate -expand -group Intermedite -label PC_o -radix hexadecimal /TB_mips/DUV/DP/DUV/register_PC/data_out
add wave -noupdate -expand -group Intermedite -label RegInstr_o -radix hexadecimal /TB_mips/DUV/DP/DUV/register_instruc/data_out
add wave -noupdate -expand -group Intermedite -label ALU_SrcA_i -radix hexadecimal /TB_mips/DUV/DP/DUV/M_ALU/a
add wave -noupdate -expand -group Intermedite -label ALU_SrcB_i -radix hexadecimal /TB_mips/DUV/DP/DUV/M_ALU/b
add wave -noupdate -expand -group Intermedite -label ALU_o -radix hexadecimal /TB_mips/DUV/DP/DUV/M_ALU/y
add wave -noupdate /TB_mips/GPIO_i_tb
add wave -noupdate /TB_mips/GPIO_o_tb
add wave -noupdate -radix decimal /TB_mips/GPIO_o_tb
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {207 ps} 0}
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
WaveRestoreZoom {0 ps} {32 ps}
