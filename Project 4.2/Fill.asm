// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

// Put your code here.
(INIT)
// Initializes the index variable i that runs on the screen's pixels
@8192  // 32 * 256 number of 16-bit pixel lines to cover the entire screen
D=A
@i     // Initializes the index variable to 8192, which is the remaining address left to color on the screen
M=D

(LOOP)
// Progresses the index backwards
@i
M=M-1
D=M
@INIT
D;JLT // If the index is less than 0, go to INDEX INITIALIZER to reset it

@KBD  // Loads the keyboard's address
D=M
@WHITE  // If (memory at keyboard address == 0), meaning no key is pressed, go to WHITE, else go to BLACK
D;JEQ
@BLACK
0;JMP

(BLACK)
// Set the current 16 pixels to black
@SCREEN  // Loads the screen's first address - 16384 (0x4000)
D=A
@i
A=D+M  // Adds the current index to the screen's first address to color the current set of 16 pixels
M=-1    // Sets the value in the current address to -1, so that the whole word 1...1 (16 bits long) will be "painted" black
@LOOP  // Jumps back to the indexer to progress the index backwards
0;JMP

(WHITE)
// Set the current 16 pixels to white
@SCREEN  // Loads the screen's first address - 16384 (0x4000)
D=A
@i
A=D+M  // Adds the current index to the screen's first address to color the current set of 16 pixels
M=0     // Sets the value in the current address to 0, so that the whole word will be 0....0 (16 bits long), meaning all 16 pixels will be "painted" white
@LOOP  // Jumps back to the indexer to progress the index backwards
0;JMP
    