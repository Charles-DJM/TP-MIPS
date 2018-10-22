#############################
#DHONT Florent              #
#de JAHAM Charles           #
#############################
.data
list: .word 0, 1, 2, 3, 4, 5, 6, 7, 8, 9
msg1: .asciiz "Entrez la valeur recherchee :  son index est "
.text

li $v0, 4
la $a0, msg1
syscall

li $v0, 5
syscall

move $a0, $v0 


###################
#Registres utilisés
#n cherché = $a0
#milieu = $t7
#debut = $t6
#fin = $t5
#resultat = $a1
###################
li $t8, 2
li $t6, 0
li $t5, 10
do:

add $t7, $t6, $t5
div $t7, $t8
mflo $t7

mfhi $t9

bne $t9, $zero, correctionmilieu #Verifie si le reste de la division est nul, sinon il corrige le resultat

suite:
la $t3, list # met l’adresse de list dans $t3
move $t2, $t7 # met milieu dans $t2
sll $t2, $t2, 2 # t2= t2*4
add $t1, $t2, $t3 # calcule l’adresse de la case milieu 
lw $t4, 0($t1) # stocke la valeur de list[milieu]

beq $t4, $a0 returnindex #si vrai, n est dans le tableau, sortie de la boucle

ble $a0, $t4 else #si n > milieu,
addi $t6, $t7, 1 # debut = milieu +1
j while

else: #si n < milieu
subi $t5, $t7, 1 #milieu = fin -1
j while
while:
ble $t6, $t5 do

li $a1, -1 #mets -1 dans le resultat car n n'est pas dans le tableau
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

correctionmilieu:
addi $t7, $t7, 1 #Ajoute 1 au résultat de la division quand le reste est non nul
j suite
