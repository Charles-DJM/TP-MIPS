#############################
#DHONT Florent              #
#de JAHAM Charles           #
#############################
.data
msg1: .asciiz "Entrer nombre a \n "
msg2: .asciiz "Entrer nombre b \n "
msg3: .asciiz "Le resultat de a*b est\n"


.text

main:
#Affichage message 1

li $v0, 4
la $a0, msg1
syscall

#Lecture de a
li $v0, 5
syscall
move $t0, $v0 #stockage de a dans $t0

#Affichage message 2
li $v0, 4
la $a0, msg2
syscall

#Lecture de b
li $v0, 5
syscall
move $t1, $v0 #stockage b dans $t1

li $t2, 0 #initialise p a 0
li $t7, 2

while: #debut de la boucle while
ble $t1, 0, done
div $t1, $t7
mfhi $t3
if:
bne $t3, 1 notequal
add $t2, $t0, $t2
notequal:
mult $t0, $t7
mflo $t0
div $t1, $t7
mflo $t1
j while #retour à la boucle while si conditions pas validée
done:

li $v0, 4
la $a0, msg3
syscall
#afficher resultat
move $a0, $t2 
li $v0, 1
syscall
#sortie du programme
li $v0, 10
syscall
