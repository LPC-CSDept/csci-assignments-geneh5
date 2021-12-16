#
# q6.asm
# Gene Han
# 12/15
#

            .kdata
s1:         .word 10
s2:         .word 11

            .data
pr:         .asciiz "Enter any character to output ('q' to quit): "
line:       .asciiz "\n"

            .text
            .globl main

main:

