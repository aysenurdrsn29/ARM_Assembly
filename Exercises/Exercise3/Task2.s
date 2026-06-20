.global _start

.equ KEYS_BASE, 0xFF200050
.equ HEX3_HEX0_BASE, 0xFF200020

_start:
    LDR R10, =KEYS_BASE
    LDR R11, =HEX3_HEX0_BASE
    MOV R8, #0          
    MOV R9, #0          

MAIN_LOOP:
    LDR R1, [R10, #0xC] // Edgecapture 
    CMP R1, #0
    BEQ MAIN_LOOP  //Polling until a key is pressed

    STR R1, [R10, #0xC] 

    TST R1, #1          //TST = and but don't store the value in the reg
    BNE DO_KEY0

    TST R1, #2          
    BNE DO_KEY1

    TST R1, #4          
    BNE DO_KEY2

    TST R1, #8          
    BNE DO_KEY3

    B MAIN_LOOP

DO_KEY0:
    MOV R8, #5          // Key 0 = display 5
    B UPDATE_DISPLAY

DO_KEY1:
    ADD R8, R8, #1      
    CMP R8, #9          // If > 9, wrap around to 0
    BGT WRAP_ZERO
    B UPDATE_DISPLAY
WRAP_ZERO:
    MOV R8, #0
    B UPDATE_DISPLAY

DO_KEY2:
    SUB R8, R8, #1      
    CMP R8, #0          //If < 0 wrp nine
    BLT WRAP_NINE
    B UPDATE_DISPLAY
WRAP_NINE:
    MOV R8, #9
    B UPDATE_DISPLAY

DO_KEY3:
    MOV R0, #0          // Clear
    STR R0, [R11]
    B MAIN_LOOP

UPDATE_DISPLAY:
    MOV R0, R8
    BL hex_display
    STR R0, [R11]       
    B MAIN_LOOP

hex_display:
    LDR R2, =SEVEN_SEG_TABLE
    LDRB R0, [R2, R0]   // Fetch exactly 1 byte using LDRB to avoid reading adjacent data
    BX LR

SEVEN_SEG_TABLE:
    .byte 0x3F, 0x06, 0x5B, 0x4F, 0x66, 0x6D, 0x7D, 0x07, 0x7F, 0x67