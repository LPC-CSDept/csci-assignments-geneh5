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
        li      $s0, 113            # constant to check if entered character is 'q'
        
infLoop:
        j       infLoop             # infinitely jump to this label until interrupt
        nop


        .ktext  0x80000180          # kernel code starts at this address
        sw      $v0, s1             # store s1 into $v0
        sw      $a0, s2             # store s2 into $a0

        mfc0    $k0, $13            # move from cause register to kernel
        srl     $a0, $k0, 2         # shift right by 2 as the exception code field starts at bit 2
        andi    $a0, $a0, 0x1f      # get the exception code only and store in a0
        bne     $a0, $zero, done    # branch to done if the exception code is not 0 (code 0 represents interrupt)
        nop

        lui     $v0, 0xFFFF         # set v0 to 0xFFFF0000
        lw      $a0, 4($v0)
        beq     $a0, $s0, end       # branch to end if the inputted character is 'q'
        nop

        li      $v0, 1              # code to print character loaded
        syscall
        la      $a0, line           # load address of new line string
        li      $v0, 4              # code to print string
        syscall

done:



end: