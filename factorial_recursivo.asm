
.data
prompt: .asciiz "INGRESE NUMERO DEL FACTORIAL A CALCULAR:  " # print string
space:  .asciiz "\n"        # space between numbers

.text
.globl main
main:

li		      $v0, 4		        # syscall read string code
la		      $a0, prompt		    # load prompt adress
syscall                       # read prompt (number)
li          $v0, 5            # syscall read_int code
syscall                       # read number
move        $s0, $v0          # move number in $v0 to $s0
li		      $v0, 4		        # syscall read string code
la		      $a0, space		    # read space
syscall                       # add space


beq         $s0, 1, bye  # if number == 1 goto bye
beq         $s0, 0, bye  # if number == 1 goto bye


addi		    $a2, $s0, -1      # $a2 = $s0-- (number - 1)


jal         factorial              # jump to "factorial" target and save position to $ra


li		      $v0, 10		        # syscall halt code
syscall


factorial:
## GUARDO $SP(STACK-POINTER), $S0(NUMBER)
addi        $sp, $sp, -8      # hago lugar en la pila
sw          $ra, 0($sp)       # push $ra
sw          $s0, 4($sp)       # push $s0 (number)
j           loop              # jump to loop


loop:
beq		      $a2, $zero, exit  # if $a2 == 0 go to exit
mul         $s0, $s0, $a2     # number *=  number-1
addi		    $a2, $a2, -1      # $a2 = $a2--
jal         loop              # jump to loop again and save position to $ra


exit:
li          $v0, 1            # syscall print int code
move        $a0, $s0          # move $s0 to $a0
syscall


lw          $ra, 0($sp)       
lw          $s0, 4($sp)       
addi        $sp, $sp, 8      


jr          $ra


bye:
li          $v0, 1            # syscall print int code
move        $a0, $s0          # move $s0 to $a0
syscall
li		      $v0, 10		        # syscall halt code
syscall
