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

