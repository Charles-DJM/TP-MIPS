.data
str1: .asciiz "Entrez un entier : "
str2: .asciiz "Son factoriel est "
ret: .asciiz "\n"

.text
### Registres utilis´es:
#
# $a0: argument fact
#
#######################
main:
li $v0, 4
la $a0, str1
syscall # demander un entier
li $v0, 5
syscall # mettre l’entier dans $v0
move $a0, $v0 # prepare le param`etre pour l’appel
jal fact # appel fact (le r´esultat sera dans $3)
## affichage r´esultat
li $v0, 4
la $a0, str2
syscall # annonce resultat
li $v0, 1
move $a0 $3
syscall # affiche resultat
li $v0, 4
la $a0, ret
syscall # retour `a la ligne
li $v0, 10
syscall # sortie du programme (syscall exit)
## procedure fact
fact:
bgt $a0 1 recur # si n<>1 appel recur
li $3 1 # sinon f(0)=1
jr $ra # retourne (adresse de retour dans $ra)
recur:
sub $sp $sp 8 # place pour sauver dans la pile $ra et $a0 (sp=sp-8)
sw $ra 4($sp) # sauve l’adresse de retour ( sp+4)
sw $a0 ($sp) # sauve le param`etre ( sp)
sub $a0 $a0 1 # n=n-1
jal fact # appel fact le resultat est dans $3
lw $a0 ($sp) # recup`ere param`etre
mul $3 $a0 $3 # multiplie resultat par param`etre
lw $ra 4($sp) # restaure adresse retour
add $sp $sp 8 # libere place pour l’adresse de retour
jr $ra # retourne (adresse de retour dans $ra)
