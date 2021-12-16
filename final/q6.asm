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

        lui     $t0, 0xFFFF         # set $t0 to 0xFFFF0000
        ori     $a0, $zero, 2       # allow keyboard interrupts
        sw      $a0, 0($t0)         # store in receiver control register
        
infLoop:
        j       infLoop             # infinitely jump to this label until interrupt
        nop


        .ktext  0x80000180          # kernel code starts at this address
        sw      $v0, s1             # store s1 into $v0
        sw      $a0, s2             # store s2 into $a0