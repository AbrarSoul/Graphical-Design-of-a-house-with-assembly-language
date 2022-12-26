.MODEL SMALL
.STACK 100H 
.DATA

VAL1 dw 0
VAL2 dw 0
VAL3 dw 0
VAL4 dw 0
VAL5 dw 0
VAL6 dw 0
VAL7 dw 0
LeftVAL dw 0
RightVAL dw 0
VALBase dw 0
ValLeft dw 0
ValRight dw 0

.CODE
MAIN PROC
    
    MOV AX,13H        ; VGA graphics 640 * 480 256 color mode
    INT 10H           ; write pixel
    MOV AH,0CH        ; pixel function
                      
                             
     
    
    
;********************************Colour******************************************
    
    
    MOV AL, 66               ; colour code
    MOV CX, 205
    MOV DX, 125
    MOV VALRight ,CX
    RightWindow:              
    RightWin:
    INT 10H    
    INC CX
    CMP CX,240
    JNE RightWin
    MOV CX,VALRight
    INC DX
    CMP DX,140
    JE ExitWinR 
    JMP RightWindow 

    
    ExitWinR: 
    
    
    
    MOV AL, 66
    MOV CX, 140
    MOV DX, 125
    MOV VALLeft,CX
    LeftWindow:
    LeftWin:
    INT 10H    
    INC CX
    CMP CX,185
    JNE LeftWin
    MOV CX,VALLeft
    INC DX
    CMP DX,140
    JE ExitWinL 
    JMP LeftWindow 

    
    ExitWinL: 
    
    
    
    MOV AL, 66
    MOV CX, 140
    MOV VAL7,CX
    MOV BX, 150
    MOV DX, 110
    Label7:
    C7:
    INT 10H
    INC CX    
    CMP CX,BX
    JNE C7
    MOV CX,VAL7
    DEC DX
    DEC BX
    CMP DX,101
    JE Exit7 
    JMP Label7
    
    Exit7: 
   
    
    
    
    MOV AL, 66
    MOV CX, 140
    MOV DX, 110
    MOV VAL6,CX
    Label6:
    C6:
    INT 10H    
    INC CX
    CMP CX,240
    JNE C6
    MOV CX,VAL6
    INC DX
    CMP DX,125
    JE Exit6 
    JMP Label6 

    
    Exit6: 
    
    
    
    MOV AL, 66
    MOV CX, 140
    MOV DX, 140
    MOV VAL5,CX
    Label5:
    C5:
    INT 10H    
    INC CX
    CMP CX,240
    JNE C5
    MOV CX,VAL5
    INC DX
    CMP DX,160
    JE Exit5 
    JMP Label5 

    
    Exit5: 
    
    
    
    MOV AL, 42
    MOV CX, 60
    MOV VALBase,CX          ; column
    MOV DX, 160
    MOV BX, 240
    Basement:
    Base:
    INT 10H    
    INC CX
    CMP CX,BX
    JNE Base
    DEC VALBase
    MOV CX,VALBase
    INC BX
    INC DX
    CMP DX,170
    JE ExitBase 
    JMP Basement 

    
    ExitBase: 
    
    
    
    MOV AL, 66
    MOV CX, 110
    MOV DX, 125
    MOV RightVAL,CX
    RightDoor:
    Right:                         
    INT 10H    
    INC CX
    CMP CX,140
    JNE Right
    MOV CX,RightVAL
    INC DX
    CMP DX,160
    JE ExitRight 
    JMP  RightDoor 

    
    ExitRight:
    
    
    
    MOV AL, 66
    MOV CX, 60
    MOV DX, 125
    MOV LeftVAL,CX
    LeftDoor:
    Left:
    INT 10H    
    INC CX
    CMP CX,90
    JNE Left
    MOV CX,LeftVAL
    INC DX
    CMP DX,160
    JE ExitLeft 
    JMP  LeftDoor 

    
    ExitLeft: 
    
    
    
    MOV AL, 66
    MOV CX, 60
    MOV DX, 101
    MOV VAL4,CX
    Label4:
    C4:
    INT 10H    
    INC CX
    CMP CX,140
    JNE C4
    MOV CX,VAL4
    INC DX
    CMP DX,125
    JE Exit4 
    JMP Label4 

    
    Exit4: 
    
    
    
    
    
    MOV AL, 66
    MOV CX, 100
    MOV VAL3,CX          ; column
    MOV DX, 60
    MOV BX, 101
    Label3:
    C3:
    INT 10H    
    INC CX
    CMP CX,BX
    JNE C3
    DEC VAL3
    MOV CX,VAL3
    INC BX
    INC DX
    CMP DX,101
    JE Exit3 
    JMP Label3 

    
    Exit3: 
    
    
     
     
    MOV AL, 42
    MOV CX, 50
    MOV VAL2,CX          ; column
    MOV DX, 110
    Label2:
    C2:
    INT 10H    
    INC CX
    CMP CX,60
    JNE C2
    INC VAL2
    MOV CX,VAL2
    DEC DX
    CMP DX,100
    JE Exit2 
    JMP Label2 
    
    
    
   Exit2: 
     
     

    MOV AL, 42
    MOV CX, 100
    MOV VAL1,CX          ; column
    MOV DX, 60
    MOV BX, 200
    Label1:
    C1:
    INT 10H    
    INC CX
    CMP CX,BX
    JNE C1
    INC VAL1
    MOV CX,VAL1
    INC BX
    INC DX
    CMP DX,110
    JE Exit 
    JMP Label1 

    
    Exit: 
    
    
;*************************Border********************************************

    
    MOV AL, 255
    
    MOV CX, 60          ; column
    MOV DX, 101          ; row
    L1:
    INT 10H
    INC DX                         
    CMP DX, 160
    JLE L1
    
    
    MOV CX, 140          ; column
    MOV DX, 101          ; row
    L2:
    INT 10H
    INC DX
    CMP DX, 160
    JLE L2
   
    MOV CX, 100          ; column
    MOV DX, 60          ; row
    L3:
    INT 10H
    INC DX
    CMP DX, 150
    DEC CX
    CMP CX, 50
    JNE L3 
    
    MOV CX, 100          ; column
    MOV DX, 60          ; row
    L4:
    INT 10H
    INC DX
    CMP DX, 150
    INC CX
    CMP CX, 150
    JNE L4 
    
    
    
    MOV CX, 60          ; column
    MOV DX, 160          ; row
    L5:
    INT 10H
    INC CX                         
    CMP CX, 240
    JLE L5
    
    
    MOV CX, 90          ; column
    MOV DX, 160          ; row
    L6:
    INT 10H
    DEC DX                         
    CMP DX, 125
    JGE L6 
    
    
    
    MOV CX, 90          ; column
    MOV DX, 125          ; row
    L7:
    INT 10H
    INC CX                         
    CMP CX, 110
    JLE L7
    
    
    MOV CX, 110          ; column
    MOV DX, 125          ; row
    L8:
    INT 10H
    INC DX                         
    CMP DX, 160
    JLE L8 
    
    
    
    MOV CX, 185          ; column
    MOV DX, 140          ; row
    L16:
    INT 10H
    DEC DX                         
    CMP DX, 125
    JGE L16 
    
    
    
    MOV CX, 185          ; column
    MOV DX, 125          ; row
    L17:
    INT 10H
    INC CX                         
    CMP CX, 205
    JLE L17
    
    
    MOV CX, 205          ; column
    MOV DX, 125          ; row
    L18:
    INT 10H
    INC DX                         
    CMP DX, 140
    JLE L18 
    
    
    MOV CX, 205          ; column
    MOV DX, 140          ; row
    L19:
    INT 10H
    DEC CX                         
    CMP CX, 185
    JGE L19
    
    
    MOV CX, 50          ; column
    MOV DX, 110          ; row
    L9:
    INT 10H
    INC CX                         
    CMP CX, 60
    JLE L9 
    
    
    MOV CX, 150          ; column
    MOV DX, 110          ; row
    L10:
    INT 10H
    INC CX                         
    CMP CX, 250
    JLE L10



    MOV CX, 100          ; column
    MOV DX, 60          ; row
    L11:
    INT 10H
    INC CX
    CMP CX, 200
    JNE L11     
            
            
    MOV CX, 200          ; column
    MOV DX, 60          ; row
    L12:
    INT 10H
    INC DX
    CMP DX, 150
    INC CX
    CMP CX, 250
    JNE L12         
    
    
    MOV CX, 240          ; column
    MOV DX, 110          ; row
    L13:
    INT 10H
    INC DX                         
    CMP DX, 160
    JLE L13
    
    
    MOV CX, 50          ; column
    MOV DX, 170          ; row
    L15:
    INT 10H
    INC CX                         
    CMP CX, 250
    JLE L15
    
    
    
    MOV CX, 60          ; column
    MOV DX, 160          ; row
    L23:
    INT 10H
    INC DX
    CMP DX, 170
    DEC CX
    CMP CX, 50
    JNE L23 
    
    MOV CX, 140          ; column
    MOV DX, 160          ; row
    L24:
    INT 10H
    INC DX
    CMP DX, 170
    INC CX
    CMP CX, 150
    JNE L24 
    
    
    MOV CX, 240          ; column
    MOV DX, 160          ; row
    L25:
    INT 10H
    INC DX
    CMP DX, 170
    INC CX
    CMP CX, 250
    JNE L25 
    

    
        
        MOV AH, 0
        INT 16H
        
        MOV AX,3
        INT 10H 
        
        MOV AH, 4CH
        INT 21H
        
    MAIN ENDP
END MAIN 
                           
                           
                    ; the line will go to right by incrementing cx
                    ; the line will go to low by incrementing dx
                    
                    
                           