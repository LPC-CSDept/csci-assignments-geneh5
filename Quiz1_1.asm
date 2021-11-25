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
        sub.s   $f0, $f0, $f1   # subtract 32.0
        l.s     $f1, num2       # load 5.0
        mul.s   $f0, $f0, $f1   # multiply by 5.0
        l.s     $f1, num3       # load 9.0
        div.s   $f0, $f0, $f1   # divide by 9.0

        