.data
msg1: .asciiz "Entrez un entier : "
msg2: .asciiz "resultat: "

.text

li $v0, 4
la $a0, msg1
syscall

li $v0, 5
syscall

move $a0, $v0 #N
jal fibo

#####

#####

fibo:
beq $a0, 1, return 1
beq $a0, $zero, return 0


recur:
sub $sp $sp 8
sw $ra 4($sp)
sw $a0 ($sp)
sub $a0 $a0 1 #n = n-1
jal fibo
