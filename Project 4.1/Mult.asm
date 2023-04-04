// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)
//
// This program only needs to handle arguments that satisfy
// R0 >= 0, R1 >= 0, and R0*R1 < 32768.

// Put your code here.

@sum     // sum = 0
M=0

@i       // i = 1
M=1

(LOOP)
@i      // D = i
D=M
@R0     // D = i - R0
D=D-M
@END    // if(i-R0) > 0 goto END
D;JGT

@R1     // D = R1
D=M
@sum    // sum = D + sum
M=D+M
@i      // i = i + 1
M=M+1
@LOOP   // Goto LOOP
0;JMP

(END)
@sum    // D = sum
D=M
@R2     // R2 = D
M=D
