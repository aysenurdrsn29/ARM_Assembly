//This is the completed task
.equ MPCORE_PRIV_TIMER, 0xFFFEC600
.equ HEX3_HEX0, 0xFF200020
.equ HEX5_HEX4, 0xFF200030

.text
.global _start
_start:
    LDR R0, =MPCORE_PRIV_TIMER
    LDR R1, =HEX3_HEX0
    LDR R2, =HEX5_HEX4
    
    LDR R3, =200000000
    STR R3, [R0]
    MOV R3, #0b011
    STR R3, [R0, #8]

Three:                     
    MOV R4, #0x40          
    MOV R7, #0             
    STR R4, [R1]
    STR R7, [R2]
    MOV R5, #0             

Logi:                      
    LDR R3, [R0, #12]
    CMP R3, #1
    BNE Logi               
    STR R3, [R0, #12]      

    CMP R5, #0             
    BEQ GO_LEFT
    BNE GO_RIGHT

GO_LEFT:
    CMP R4, #0x40000000    
    BEQ TRANS_LEFT         
    CMP R7, #0             
    BNE SHIFT_LEFT_R7      

    LSL R4, R4, #8
    B UPDATE_DISPLAYS

TRANS_LEFT:
    MOV R4, #0             
    MOV R7, #0x40          
    B UPDATE_DISPLAYS

SHIFT_LEFT_R7:
    LSL R7, R7, #8         
    MOV R5, #1             
    B UPDATE_DISPLAYS

GO_RIGHT:
    CMP R7, #0x40          
    BEQ TRANS_RIGHT        
    CMP R7, #0             
    BNE SHIFT_RIGHT_R7     

    LSR R4, R4, #8
    CMP R4, #0x40          
    MOVEQ R5, #0           
    B UPDATE_DISPLAYS

TRANS_RIGHT:
    MOV R7, #0             
    MOV R4, #0x40000000   
    B UPDATE_DISPLAYS

SHIFT_RIGHT_R7:
    LSR R7, R7, #8         
    B UPDATE_DISPLAYS

UPDATE_DISPLAYS:
    STR R4, [R1]          
    STR R7, [R2]           
    B Logi

.end