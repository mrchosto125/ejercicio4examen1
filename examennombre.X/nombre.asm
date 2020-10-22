#include "p16F628a.inc"
 __CONFIG _FOSC_INTOSCCLK & _WDTE_OFF & _PWRTE_OFF & _MCLRE_OFF & _BOREN_OFF & _LVP_OFF & _CPD_OFF & _CP_OFF
;Se configura todo apagado

RES_VECT CODE 0x0000 ; processor reset vector
GOTO START ; go to beginning of program
; TODO ADD INTERRUPTS HERE IF USED
MAIN_PROG CODE ; let linker place main program

 
i equ 0x30;Identificadores
j equ 0x31;Identificadores
k equ 0x32;Identificadores
e equ 0x33
 
START
    MOVLW 0x07;Apagar comparadores en este caso es del 0-7
    MOVWF CMCON;Y establecer los pines como entrada y salida
    BCF STATUS, RP1 ;
    BSF STATUS, RP0 ;Encender un bit del registro F
    MOVLW b'00000000'
    MOVWF TRISB ;Registro donde les decimos si es entrada o salida
    BCF STATUS, RP0 ;Apgao y regeso todo a lo normal


inicio:
    BSF PORTB,0
    call tiempo2;357ms
    BCF PORTB,0
    call tiempo1;643ms
    GOTO inicio
    
tiempo1:
    MOVLW d'10'
    nop
    nop
    MOVWF i ;Movemos el 255 a i
loopj:    
    MOVLW d'99'
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    MOVWF j ;Movemos el 255 a j
loopk: 
    MOVLW d'215'
    MOVWF k ;Movemos el 255 a k
    ;Decrementaremos k porque es el mas anidado es decir mas adentro
    DECFSZ k ;Decrementar hasta que de 0 por default 
    ;la primera instruccion es la que hara hasta que llegue a 0 la 2 es lo que hara despues de estar en 0
    GOTO $-1 ;Regresar a la instruccion anterio con $-1
    DECFSZ j;Cuando ya llego 0 entra a aqui
    GOTO loopk
    DECFSZ i
    GOTO loopj
    return
    
    
tiempo2:
    MOVLW d'10'
    nop
    nop
    nop
    nop
    MOVWF i ;Movemos el 255 a i
loopj2:    
    MOVLW d'101'    
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    MOVWF j ;Movemos el 255 a j
loopk2: 
    MOVLW d'116'
    nop
    MOVWF k ;Movemos el 255 a k
    ;Decrementaremos k porque es el mas anidado es decir mas adentro
    DECFSZ k ;Decrementar hasta que de 0 por default 
    ;la primera instruccion es la que hara hasta que llegue a 0 la 2 es lo que hara despues de estar en 0
    GOTO $-1 ;Regresar a la instruccion anterio con $-1
    DECFSZ j;Cuando ya llego 0 entra a aqui
    GOTO loopk2
    DECFSZ i
    GOTO loopj2
    return
    
END