.data
prompt: .asciiz "Ingrese un numero\n"

.text
  .globl main
    main:
    li $v0, 4       # syscall code para imprimir un string
    la $a0, prompt  # cargamos la direccion del string
    syscall         # print "Ingrese un numero\n"

    li $v0, 5       # sycall code para leer un int
    syscall         # leemos el entero y el resultado esta en $v0
    move $t0, $v0   # movemos lo de v0 a t0 (el resultado de leer el entero)

    addi $a0, $t0, -1 #le resto al numero ingresado 1

    jal factorial

    exit:
    li $v0, 1
    move $a0, $t0 #muevo lo que esta en t0 a a0
    syscall

    li        $v0, 10
    syscall                         # exit :D

    jr $ra

    factorial:
    beq  $a0, $zero, exit
    mul $t0, $t0, $a0 #mutiplico  y lo guardo en t1
    addi $a0, $a0, -1 #le resto al numero ingresado 1
    j factorial
