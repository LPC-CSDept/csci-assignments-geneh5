 #
 # Quiz1_2.asm
 #
 # Gene Han
 # 10/25
 # CS21 Quiz 1 Part 2
 # Evaluating a polynomial
 #

        .data
inputa: .asciiz "Input value for variable 'a': "
inputb: .asciiz "Input value for variable 'b': "
inputc: .asciiz "Input value for variable 'c': "
inputx: .asciiz "Input value for variable 'x': "
done:   .asciiz "ax^2 + bx + c = "
line:   .asciiz "\n"

        .text
        .globl main

main:
        la      $a0, inputa         # load inputa 
        li      $v0, 4              # print string
        syscall
        li      $v0, 6              # read float
        syscall
        mov.s   $f1, $f0            # move to FP register

        la      $a0, inputb         # load inputb 
        li      $v0, 4              # print string
        syscall
        li      $v0, 6              # read float
        syscall
        mov.s   $f2, $f0            # move to FP register

        la      $a0, inputc         # load inputc 
        li      $v0, 4              # print string
        syscall
        li      $v0, 6              # read float
        syscall
        mov.s   $f3, $f0            # move to FP register

        la      $a0, inputx         # load inputx 
        li      $v0, 4              # print string
        syscall
        li      $v0, 6              # read float
        syscall
        mov.s   $f4, $f0            # move to FP register

        mul.s   $f0, $f4, $f4       # x * x
        nop
        mul.s   $f0, $f0, $f1       # a * x^2
        nop
        mul.s   $f1, $f4, $f2       # b * x
        nop
        add.s   $f0, $f0, $f1       # ax^2 + bx
        add.s   $f0, $f0, $f3       # ax^2 + bx + c
        mov.s   $f12, $f0           # move value to FP register

        la      $a0, line           # new line
        li      $v0, 4              # print string
        syscall
        la      $a0, done           # load ending string
        syscall
        li      $v0, 2              # print float
        syscall

        li      $v0, 10             # exit code
        syscall
