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
add wave -noupdate -color Gold -radix binary -childformat {{{/TB_mips/GPIO_tb[7]} -radix hexadecimal} {{/TB_mips/GPIO_tb[6]} -radix hexadecimal} {{/TB_mips/GPIO_tb[5]} -radix hexadecimal} {{/TB_mips/GPIO_tb[4]} -radix hexadecimal} {{/TB_mips/GPIO_tb[3]} -radix hexadecimal} {{/TB_mips/GPIO_tb[2]} -radix hexadecimal} {{/TB_mips/GPIO_tb[1]} -radix hexadecimal} {{/TB_mips/GPIO_tb[0]} -radix hexadecimal}} -subitemconfig {{/TB_mips/GPIO_tb[7]} {-color Gold -radix hexadecimal} {/TB_mips/GPIO_tb[6]} {-color Gold -radix hexadecimal} {/TB_mips/GPIO_tb[5]} {-color Gold -radix hexadecimal} {/TB_mips/GPIO_tb[4]} {-color Gold -radix hexadecimal} {/TB_mips/GPIO_tb[3]} {-color Gold -radix hexadecimal} {/TB_mips/GPIO_tb[2]} {-color Gold -radix hexadecimal} {/TB_mips/GPIO_tb[1]} {-color Gold -radix hexadecimal} {/TB_mips/GPIO_tb[0]} {-color Gold -radix hexadecimal}} /TB_mips/GPIO_tb
add wave -noupdate -color Gold -radix hexadecimal -childformat {{{/TB_mips/GPIO_tb[7]} -radix hexadecimal} {{/TB_mips/GPIO_tb[6]} -radix hexadecimal} {{/TB_mips/GPIO_tb[5]} -radix hexadecimal} {{/TB_mips/GPIO_tb[4]} -radix hexadecimal} {{/TB_mips/GPIO_tb[3]} -radix hexadecimal} {{/TB_mips/GPIO_tb[2]} -radix hexadecimal} {{/TB_mips/GPIO_tb[1]} -radix hexadecimal} {{/TB_mips/GPIO_tb[0]} -radix hexadecimal}} -subitemconfig {{/TB_mips/GPIO_tb[7]} {-color Gold -radix hexadecimal} {/TB_mips/GPIO_tb[6]} {-color Gold -radix hexadecimal} {/TB_mips/GPIO_tb[5]} {-color Gold -radix hexadecimal} {/TB_mips/GPIO_tb[4]} {-color Gold -radix hexadecimal} {/TB_mips/GPIO_tb[3]} {-color Gold -radix hexadecimal} {/TB_mips/GPIO_tb[2]} {-color Gold -radix hexadecimal} {/TB_mips/GPIO_tb[1]} {-color Gold -radix hexadecimal} {/TB_mips/GPIO_tb[0]} {-color Gold -radix hexadecimal}} /TB_mips/GPIO_tb
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {58 ps} 0}
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
WaveRestoreZoom {32 ps} {64 ps}
