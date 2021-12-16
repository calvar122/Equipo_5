.text
	addi $s2, $s2, 0
	addi $s0, $s0, 1
	addi $s1, $s1, 2
main:
	ori $s3,$s3, 0
	addi $s4,$s4,1
	beq $s2,$s3, else	
if:
	addi $s0, $s0, 1
	j main
else:
	addi $s1, $s1, 2
	j main
