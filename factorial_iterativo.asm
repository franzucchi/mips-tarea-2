.data
prompt: .asciiz "Ingrese un numero\n"


.text
  .globl main
    main:
    li $v0, 4       
    la $a0, prompt  
    syscall         

    li $v0, 5      
    syscall        
    move $t0, $v0   

    addi $a0, $t0, -1 


    jal factorial

    exit:
    li $v0, 1
    move $a0, $t0 
    syscall

    li        $v0, 10
    syscall                        

    jr $ra

    factorial:
    beq  $a0, $zero, exit
    mul $t0, $t0, $a0 
    addi $a0, $a0, -1 
    j factorial
