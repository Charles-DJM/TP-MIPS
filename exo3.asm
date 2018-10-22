#############################
#DHONT Florent              #
#de JAHAM Charles           #
#############################
.text
main:
# Print msg1
li $v0,4 # print_string syscall code = 4
la $a0, msg1
syscall
#
# Get N from user and save
li $v0,5 # read_int syscall code = 5
syscall
move $t0,$v0 # syscall results returned in $v0
#
# Initialize registers
li $t1, 0 # initialize counter (i)
li $t2, 1 # initialize sum

#
# Main loop body
loop:
addi $t1, $t1, 1 # i = i + 1
mult $t2, $t1 # lo = sum * i
mflo $t2  #sum = lo
beq $t0, $t1, exit # if i = N, continue
j loop
#
# Exit routine - print msg2
exit:
li $v0, 4 # print_string syscall code = 4
la $a0, msg2
syscall
#
# Print sum
li $v0,1 # print_int syscall code = 1
move $a0, $t2
syscall
#
# Print newline
li $v0,4 # print_string syscall code = 4
la $a0, lf
syscall
li $v0,10 # exit
syscall
#
# Start .data segment (data!)
.data
msg1: .asciiz "Entrez n"
msg2: .asciiz "Factoriel n = "
lf: .asciiz "\n"
