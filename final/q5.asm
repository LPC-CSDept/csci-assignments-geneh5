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
        li      $t3, 2                  # constant to check which loop
        li      $t4, 1                  # constant to check which loop
        li      $t5, 100                # constant to multiply first digit
        li      $t6, 10                 # constant to multiply second digit

loop:
        lw      $t2, 0($t1)             # load from input control register
        andi    $t2, $t2, 0x0001        # reset all bits except lowest order bit
        beqz    $t0, done               # branch to loop if ready bit is not 1
        nop                             # delay slot after branch

        lw      $s0, 4($t1)             # ready bit is 1, load receiver data address
        sub     $s0, $s0, 48            # subtract ascii code to get digit value
        sub     $t0, $t0, 1             # subtract counter for loop
        beqz    $t0, done               # finished reading 3 digits, branch to done
        nop                             # delay slot after branch

        beq     $t0, $t3, first         # branch to first on first digit
        nop                             # delay slot after branch

        beq     $t0, $t4, sec           # branch to sec on second digit
        nop                             # delay slot after branch

first:
        mult    $s0, $t5                # multiply first digit by 100
        mflo    $s1                     # put value into s1

        b       loop                    # branch back to loop
        nop                             # delay slot after branch

second:
        mult    $s0, $t6                # multiply second digit by 10
        mflo    $s2                     # put value into s2

        b       loop                    # branch back to loop
        nop                             # delay slot after branch