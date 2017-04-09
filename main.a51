;;;;;;;;;;;;;;;;;;;;;;;;;;;Codigo executado pelo micro;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

					CALL Inicialize
MainCode:
					CALL ReadKeyboard
					CALL ReadCheck
					JMP MainCode			


;;;;;;;;;;;;;;;;;;;;;;Funcoes de debug;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
PiscaLedInfinito:	;Funcao usada como debug, ativa e desativa todas as portas do P1 
					;Os invervalos sao de 1 segundo
					MOV P1, #11111111B
					CALL Delay
					MOV P1, #00
					CALL Delay
					JMP PiscaLedInfinito


;;;;;;;;;;;;;;;;;;;;;Funcoes de delay;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

Delay:	;Um segundo de delay			
					MOV R7,#255
LOOP:				MOV R6,#255
LOOP2:				MOV R5,#17
					DJNZ R5,$
					DJNZ R6,LOOP2
					DJNZ R7,LOOP
					RET
					
Delay2:	;Um dezesete avos de  segundo de delay			
					MOV R7,#255
LOOP21:				MOV R6,#255
LOOP22:				MOV R5,#1
					DJNZ R5,$
					DJNZ R6,LOOP2
					DJNZ R7,LOOP
					RET
					
DelayBeep1:	;Delay de 1/(17*255) segundos (usado para frequencias sonoras)	
					MOV R7,#255
LOOPb1:				MOV R6,#1
LOOP2b1:			MOV R5,#1
					DJNZ R5,$
					DJNZ R6,LOOP2b1
					DJNZ R7,LOOPb1
					RET
DelayBeep2:	;Delay de 1/(170*255) segundos (usado para frequencias sonoras)		
					MOV R7,#25
LOOPb2:				MOV R6,#1
LOOP2b2:			MOV R5,#1
					DJNZ R5,$
					DJNZ R6,LOOP2b2
					DJNZ R7,LOOPb2
					RET
					
					
					
DelayBeep3:	;Delay de 4/(170*255) segundos (usado para frequencias sonoras)			
					MOV R7,#100
LOOPb3:				MOV R6,#1
LOOP2b3:			MOV R5,#1
					DJNZ R5,$
					DJNZ R6,LOOP2b3
					DJNZ R7,LOOPb3
					RET					

;;;;;;;;;;;;;;;;;;;;;Funcoes sonorras;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

beep1:  	;Um beep de aproximadamente 3 segundos para quando o usuario errar a senha
			MOV R4,#100
internoBeep1:
			MOV R3,#2
internoBeep12:
			MOV P1,#11111111b
			CALL DelayBeep1
			MOV P1,#00000000b
			CALL DelayBeep1
			DJNZ R3,internoBeep12
			DJNZ R4,internoBeep1
			RET
			
beep2:  	;Um beep de aproximadamente 3 segundos para quando o usuario errar a senha
			MOV R4,#100
internoBeep2:
			MOV R3,#20
internoBeep22:
			MOV P1,#11111111b
			CALL DelayBeep2
			MOV P1,#00000000b
			CALL DelayBeep2
			DJNZ R3,internoBeep22
			DJNZ R4,internoBeep2
			RET			
			
			
beep3:  	;Um curto beep para quando o usuario apertar um botao
			MOV R4,#100
internoBeep3:
			MOV R3,#5
internoBeep32:
			MOV P1,#11111111b
			CALL DelayBeep3
			MOV P1,#00000000b
			CALL DelayBeep3
			DJNZ R3,internoBeep32
			DJNZ R4,internoBeep3
			RET			
					
;;;;;;;;;;;;;;;;;;;;;Funcoes auxiliares;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;			

Inicialize:			;Inicia todas as variaveis que precisam ser zeradas ou receber algum valor
					CLR A
					CALL ResetPass
					RET

ResetPass:			;Zera os registradores de senha e colocar o valor inicial de R1
					MOV R2,#0
					MOV R1,#185
					MOV A,#0
					MOV @R1,A
					
					MOV R1,#186
					MOV A,#0
					MOV @R1,A
					
					MOV R1,#187
					MOV A,#0
					MOV @R1,A
					
					MOV R1,#184
					MOV A,#0
					MOV @R1,A

					RET

PassCheck:;Funcao que verifica se foi salvo 4 valores na memoria e checa se o valor esta valido
					MOV A,R1 ;
					SUBB A,#187
					JC EndCheckPass
					
					;Conferindo a senha 1 (1111)
					MOV R0,#184
					MOV A,@R0
					MOV R0,A
					CJNE R0,#1,SecondPass 
					
					MOV R0,#185
					MOV A,@R0
					MOV R0,A
					CJNE R0,#1,SecondPass 
					
					MOV R0,#186
					MOV A,@R0
					MOV R0,A
					CJNE R0,#1,SecondPass 
					
					MOV R0,#187
					MOV A,@R0
					MOV R0,A
					CJNE R0,#1,SecondPass
					
					JMP acertouMizeravi
					
SecondPass:	
					;Conferindo a senha 2 (1234)
					MOV R0,#184
					MOV A,@R0
					MOV R0,A
					CJNE R0,#1,WrongPass 
					
					MOV R0,#185
					MOV A,@R0
					MOV R0,A
					CJNE R0,#2,WrongPass 
					
					MOV R0,#186
					MOV A,@R0
					MOV R0,A
					CJNE R0,#3,WrongPass 
					
					MOV R0,#187
					MOV A,@R0
					MOV R0,A
					CJNE R0,#4,WrongPass

acertouMizeravi:
					CALL AcertouSenha
					JMP EndCheckPass
WrongPass:			
					CALL ErrouSenha
EndCheckPass:		
					RET

ReadCheck:;Funcao que verifica se o valor lido no telcado e valido e armazena esse valor na memoria interna no endereco 184 a 188
					SUBB A,#10
					JNC CheckEnter
					ADD A,#10
					MOV @R1,A
					MOV A,R1
					ADD A,#1
					MOV R1,A
					
					
					;Salvando o numero de botoes apertados
					CLR A
					MOV A,R2
					ADD A,#1
					MOV R2,A
					MOV A,R2
					CALL beep3
					CALL Delay2
					JMP Done
CheckEnter:			
					ADD A,#10
					CJNE A,#10,CheckEsc 
					
					;Apertou enter
					CALL beep3
					CALL PassCheck
					CALL ResetPass
					
					JMP Done

CheckEsc:			CJNE A,#11,Done 
					;Apertou ESC
					CALL beep3
					CALL ResetPass
Done:				RET
	
	
	
ReadKeyboard: ;;Funcao do professor hugo para ler o teclado matricial
			COL0: 	MOV P3, #11110111B ;coluna 0
					MOV A, P3
					CJNE A, #11110111B, CL00
					
			COL1: 	MOV P3, #11111011B ;coluna 1
					MOV A, P3
					CJNE A, #11111011B, CL10

			COL2: 	MOV P3, #11111101B ;coluna 2
					MOV A, P3
					CJNE A, #11111101B, CL20
					
			COL3: 	MOV P3, #11111110B ;coluna 3
					MOV A, P3
					CJNE A, #11111110B, CL30
					
					
					RET
					
					
			CL00: 	CJNE A, #11100111B, CL01 ;coluna 0, linha 0
					MOV A, #1
					RET
					
			CL01: 	CJNE A, #11010111B, CL02 ;coluna 0, linha 1
					MOV A, #5
					RET
					
			CL02: 	CJNE A, #10110111B, CL03 ;coluna 0, linha 2
					MOV A, #9
					RET
					
			CL03: 	CJNE A, #01110111B, VT03 ;coluna 0, linha 3
					MOV A, #12
			VT03: 	RET
			
			CL10: 	CJNE A, #11101011B, CL11 ;coluna 1, linha 0
					MOV A, #2
					RET
					
			CL11: 	CJNE A, #11011011B, CL12 ;coluna 1, linha 1
					MOV A, #6
					RET
					
			CL12: 	CJNE A, #10111011B, CL13 ;coluna 1, linha 2
					MOV A, #0
					RET
					
			CL13: 	CJNE A, #01111011B, VT13 ;coluna 1, linha 3
					MOV A, #13
			VT13: 	RET

			CL20: 	CJNE A, #11101101B, CL21 ;coluna 2, linha 0
					MOV A, #3
					RET

			CL21: 	CJNE A, #11011101B, CL22 ;coluna 2, linha 1
					MOV A, #7
					RET

			CL22: 	CJNE A, #10111101B, CL23 ;coluna 2, linha 2
					MOV A, #10
					RET

			CL23: 	CJNE A, #01111101B, VT23 ;coluna 2, linha 3
					MOV A, #14
			VT23: 	RET


			CL30: 	CJNE A, #11101110B, CL31 ;coluna 3, linha 0
					MOV A, #4
					RET
					
			CL31: 	CJNE A, #11011110B, CL32 ;coluna 3, linha 1
					MOV A, #8
					RET
					
			CL32: 	CJNE A, #10111110B, CL33 ;coluna 3, linha 2
					MOV A, #11
					RET

			CL33: 	CJNE A, #01111110B, VT33 ;coluna 3, linha 3
					MOV A, #15
			VT33: 	RET

AcertouSenha:		;Buzzer certo e motor
					CALL beep1
					RET

ErrouSenha:			;Buzzer errado
					CALL beep2
					CALL Delay
					RET
FIM:	
					END