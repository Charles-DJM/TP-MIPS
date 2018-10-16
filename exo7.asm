.data
msg1: .asciiz "Entrez un entier : "
msg2: .asciiz "resultat: "

.text

li $v0, 4
la $a0, msg1
syscall

li $v0, 5
syscall

move $a0, $v0
jal fibo

#####

#####

fibo:
bgt $v0 1 recur
li $3 1
jr $ra

recur:
sub $sp $sp 8
sw $ra 4($sp)
sw $a0 ($sp)
