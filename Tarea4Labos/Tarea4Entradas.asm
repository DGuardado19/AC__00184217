org 	100h

section .text
        call texto
        mov	dx,msg12
	call	print
	xor 	di, di 

inicio:	
        mov     bx, 0d
        mov     ax, 0d
        cmp 	di,5d 
	je	loops
        call 	kbwait
        sub     al, 30h
	mov	[300h+di], al 
	inc 	di
	jmp 	inicio

loops:    
        add     al, [300h+bx]
        inc     bx
        cmp     bx, 5d
        jnae      loops
        mov     [306h], al
        mov     [307h], bl
        mov     cl, bl
        div     cl
        mov     [308h], al

        mov 	dx, nl
	call	print
	cmp     al, 10d
        je      p10
        cmp     al, 9d
        je      p9
        cmp     al, 8d
        je      p8
        cmp     al, 7d
        je      p7
        cmp     al, 6d
        je      p6
        cmp     al, 5d
        je      p5
        cmp     al, 4d
        je      p4
        cmp     al, 3d
        je      p3
        cmp     al, 2d
        je      p2
        cmp     al, 1d
        je      p1

texto:	
        mov 	ah, 00h
	mov	al, 03h
	int 	10h
	ret
p1:	
        mov 	dx, msg1
        jmp     endprint
p2:	
        mov 	dx, msg2
        jmp     endprint
p3:	
        mov 	dx, msg3
        jmp     endprint
p4:	
        mov 	dx, msg4
        jmp     endprint
p5:	
        mov 	dx, msg5
        jmp     endprint
p6:	
        mov 	dx, msg6
        jmp     endprint
p7:	
        mov 	dx, msg7
        jmp     endprint
p8:	
        mov 	dx, msg8
        jmp     endprint
p9:	
        mov 	dx, msg9
        jmp     endprint
p10:	
        mov 	dx, msg10
        jmp     endprint
endprint:
        call 	print
        mov 	dx, nl
        call    print
        mov 	dx, msg11
        call    print
	call 	kbwait
	int 	20h

kbwait: 	
        mov	ah, 1h
	int 	21h
	ret
print:
        mov	ah, 09h
	int 	21h
	ret

section .data

msg1 	db 	"Solo necesito el 0$"
msg2 	db 	"Aun se pasa$"
msg3 	db 	"Hay salud$"
msg4 	db 	"Me recupero$"
msg5 	db 	"En el segundo$"
msg6 	db 	"Peor es nada$"
msg7 	db 	"Muy bien$"
msg8 	db 	"Colocho$"
msg9 	db 	"Siempre me esfuerzo$"
msg10 	db 	"Perfecto solo Dios$"
msg11   db      "Int 21/09$"
msg12   db      "Ingresa los ultimos 5 digitos de tu carnet: $"

nl	db 	0xA, 0xD, "$"