 #
 # Quiz1_1.asm
 #
 # Gene Han
 # 10/25
 # CS21 Quiz 1 Part 1
 # Converting Fahrenheit to Celsius
 #
       
        .data
num1:   .float  32.0
num2:   .float  5.0
num3:   .float  9.0
input:  .asciiz "Input an integer Fahrenheit value: "
done:   .asciiz "Converted to Celsius: "
line:   .asciiz "\n"

        .text
        .globl main

main:
        la      $a0, input      # load input prompt
        li      $v0, 4          # print input prompt
        syscall
        li      $v0, 5          # read integer
        syscall

        mtc1    $v0, $f0        # move integer to FP register
        cvt.s.w $f0, $f0        # convert from int to single precision FP
        
        l.s     $f1, num1       # load 32.0
        nop
        sub.s   $f0, $f0, $f1   # subtract 32.0

        l.s     $f2, num2       # load 5.0
        nop
        mul.s   $f0, $f0, $f2   # multiply by 5.0
        
        l.s     $f3, num3       # load 9.0
        nop
        div.s   $f0, $f0, $f3   # divide by 9.0

        mov.s   $f12, $f0       # move result value into float print register

        la      $a0, line       # new line
        li      $v0, 4          # print string
        syscall
        la      $a0, done       # load done prompt
        syscall
        li      $v0, 2          # print float
        syscall

        li      $v0, 10         # exit code
        syscall