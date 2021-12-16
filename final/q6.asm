#
# q6.asm
# Gene Han
# 12/15
#

        .kdata
s1:     .word 10
s2:     .word 11

        .data
pr:     .asciiz "Enter any character to output ('q' to quit): "
line:   .asciiz "\n"

        .text
        .globl main

main:

        la      $a0,pr              # load address of prompt
        li      $v0, 4              # code for print string
        syscall

        mfc0    $a0, $12            # move from c0 (status register)
        ori     $a0, 0xFF11         # enable all interrupts in $12
        mtc0    $a0, $12            # move to c0 (status register)