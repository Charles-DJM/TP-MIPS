.data
list: .word 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10
msg1: .asciiz "Entrez un la valeur : "
.text

li $v0, 4
la $a0, msg1
syscall

li $v0, 5
syscall

move $a0, $v0 


############
#val = $a0
#mil = $t7
#debut = $t6
#fin = $t5
#resultat = $a1
############

li $t5, 10
do:

add $t7, $t6, $t5
srl $t7, $t7, 1

la $t3, list # met l’adresse de list dans $t3
move $t2, $t7 # met milieu dans $t2
sll $t2, $t2, 2 # t2= t2*4
add $t1, $t2, $t3 # calcule l’adresse de la case milieu 
lw $t4, 0($t1) # stocke la valeur de list[milieu]

beq $t4, $a0 returnindex

ble $a0, $t4 else
add $t6, $t7, 1
j while

else:
sub $t5, $t7, 1
j while
while:
blt $t6, $t5 do

li $a1, -1
j fin

returnindex:
move $a1, $t7
j fin

fin:

#afficher resultat
move $a0, $a1
li $v0, 1
syscall
#sortie du programme
li $v0, 10
syscall
