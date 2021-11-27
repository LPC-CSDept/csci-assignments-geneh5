 #
 # Quiz1_3.asm
 #
 # Gene Han
 # 10/26
 # CS21 Quiz 1 Part 3
 # Newton's Method
 #
 
        .data
input:	.asciiz	"Enter value for 'n' variable: "
done:	.asciiz	"The square root is: "
line:	.asciiz "\n"

	    .text
	    .globl main

main:
        la      $a0, input          # load input
        li      $v0, 4              # print string
        syscall
        li      $v0, 6              # read float
        syscall

        li.s    $f3, 1.0            # first x approx
        li.s    $f2, 2.0            # load 2.0 const
        li.s    $f10, 1.0e-5        # terminate condition
        