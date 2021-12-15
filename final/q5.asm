#
# q5.asm
# Gene Han
# 12/14
#
        .data
input:  .asciiz "Enter digit: "         # input prompt

        .text
        .globl main

main:
        la      $a0, input
        li      $v0, 4
        syscall