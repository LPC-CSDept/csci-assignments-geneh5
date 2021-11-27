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

loop:
        mov.s	$f4, $f0	        # x' = n
	    div.s	$f4, $f4, $f3	    # x' = n/x
	    add.s	$f4, $f3, $f4	    # x' = x + n/x
	    div.s	$f4, $f4, $f2	    # x' = (1/2)(x + n/x)

	    sub.s	$f5, $f4, $f3	    # x' - x
	    mov.s	$f3, $f4	        # set new x
	    abs.s	$f5, $f5	        # abs of x' - x
	    c.lt.s	$f5, $f10	        # check if less than terminate
	    bc1f	loop		        # loop
	    nop

        mov.s	$f12, $f4	        # move to print result
	    la	$a0, line	            # load new line
	    li	$v0, 4	
	    syscall
	    la	$a0, done	            # load done string
	    syscall
	    li	$v0, 2		            # print float
	    syscall

	    li	$v0, 10		            # exit code
	    syscall