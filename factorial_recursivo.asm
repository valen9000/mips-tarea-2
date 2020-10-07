.data
ingrese: .asciiz "Ingrese un numero: "

.text
.globl main
main:
#Pido y Guardo un numero del usuario
li $v0, 4
la $a0, ingrese
syscall

li $v0, 5
syscall
move $a0, $v0

jal factorial	#Factorial de $a0

#Imprimo resultado
move $a0, $v0
li $v0, 1
syscall

#exit
li $v0, 10
syscall

factorial:
#Prologo
addi $sp, $sp, -12	#Genero 12 lugares (3 registros)
sw $a0, 0($sp)		#Guardo $a0
sw $t2, 4($sp)		#Guardo $t2
sw $ra, 8($sp)		#Guardo $ra

#Casos base
li $t0, 1
beq $a0, $t0, f1f0	#si $a0 = 1, expulsa 1
beq $a0, $zero, f1f0	#si $a0 = 0, expulsa 1

#No es caso base
move $t2, $a0     #t2 = a0
addi $a0, $a0, -1	#a0--
jal factorial		  #factorial(a0)
move $t1, $v0		  #t1 = factorial(a0)
mul $v0, $t1, $t2	#t1*t2
j return

f1f0:
li $v0, 1 #v0 = 1
j return  #Termino

return:
# epilogo
lw $a0, 0($sp)
lw $t2, 4($sp)
lw $ra, 8($sp)
addi $sp, $sp, 12
jr $ra
