#############################
#DHONT Florent              #
#de JAHAM Charles           #
#############################
#Exercice 5 prenant en compte les d�lais de branchemenents
#######################

.data
msg1: .asciiz "Entrer nombre n \n "
msg2: .asciiz "resultat \n "

.text

fact:
#affichage msg1
li $v0, 4
la $a0, msg1
syscall

li $v0, 5
syscall #lecturre de n
move $t0, $v0 #Stockage de n dans $t0

li $t1, 1 #initilise de res

jal facttail
nop
#affichage du resultat
li $v0, 4
la $a0, msg2
syscall

li $v0, 1
move $a0, $t1
syscall

#sortie 

li $v0, 10
syscall

facttail:

bgt $t0, 1, else
nop
move $t2, $t1 # s = res
jr $ra
nop
else:
mult $t0, $t1 #res*n
mflo $t1 

sub $t0, $t0, 1 #n-1
j facttail
nop
