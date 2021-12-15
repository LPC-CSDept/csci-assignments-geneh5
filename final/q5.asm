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
        la      $a0, input              # load address of input string
        li      $v0, 4                  # load print string code
        syscall

        li      $t0, 3                  # countdown to 0 for loop (number of digits)
        lui     $t1, 0xFFFF             # load receiver control address in kernel

loop:
        lw      $t2, 0($t1)             # load from input control register
        andi    $t2, $t2, 0x0001        # reset all bits except lowest order bit
        beqz    $t0, done               # branch to loop if ready bit is not 1
        nop                             # delay slot after branch