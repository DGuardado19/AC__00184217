    org 	100h
section .text
	call 	texto	
	call 	cursor
	call 	phrase
    xor 	si, si
aux:    call    kbwait
	    cmp si, 5d 
	    je  mostrar
	    mov	[300h+si], al
	    inc si
	    jmp aux

mostrar:call w_strng
	  
	    int 20h

texto:	mov ah, 00h
	    mov	al, 03h
	    int 10h
	    ret

kbwait: mov ah, 0000h
        int 16h
        ret

w_strng:mov	ah, 13h
        mov al, 01h 
        mov bh, 00h 
        mov	bl, 01000110b
        mov	cx, si
        mov	dl, 43d
        mov	dh, 17d	
        push cs 
        pop	es
        mov	bp, 300h
        int 10h
        ret

cursor: mov	ah, 01h
	    mov ch, 00000000b
        mov cl, 00001110b
        ; IRGB
        int 10h
        ret

w_char:	mov ah, 09h
        mov	al, cl
        mov	bh, 0h
        mov bl, 01000000b
        mov	cx, 1h
        int	10h
        ret


cursor1:mov ah, 02h
        mov dx, di  ; columna
        ADD	dl, 43d ;off columna
        mov dh, 15d ; fila
        mov bh, 0h
        int 10h
        ret


phrase:	mov di, 0d
lupi:	mov cl, [msg+di]
        call cursor1
        call w_char
        inc	di
        cmp di, len
        jb	lupi
        ret

section .data
msg	    db 	"Escriba una palabra de 5 caracteres"
len 	equ	$-msg
