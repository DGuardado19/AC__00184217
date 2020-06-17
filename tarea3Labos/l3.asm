        org 	100h

section .text

	call 	texto	
	call 	cursor
	call 	phrase
	call	kbwait

	    int 	20h

texto:	mov ah, 00h
	    mov	al, 03h
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
        mov	bl, 00001111b
        mov	cx, 1h
        int	10h
        ret

kbwait: mov ax, 0000h
        int 16h
        ret

cursor1:mov ah, 02h
        mov dx, di  ; columna
        ADD	dl, 27d ;off columna
        mov dh, 6d ; fila
        mov bh, 0h
        int 10h
        ret

cursor2:mov ah, 02h
        mov dx, di  
        ADD	dl, 2d 
        mov dh, 8d 
        mov bh, 0h
        int 10h
        ret

cursor3:mov ah, 02h
        mov dx, di  
        ADD	dl, 10d 
        mov dh, 10d 
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
        call phrase2
        ret

phrase2:mov di, 0d
lupi2:	mov cl, [msg2+di]
        call cursor2
        call w_char
        inc	di
        cmp di, len3
        jb	lupi2
        call phrase3
        ret

phrase3:mov di, 0d
lupi3:	mov cl, [msg3+di]
        call cursor3
        call w_char
        inc	di
        cmp di, len2
        jb	lupi3
        ret

section .data
msg	    db 	"Pero cayeron desde un penthouse"
len 	equ	$-msg

msg2	db 	"En mi ojo un teclado y un mouse"
len3 	equ	$-msg2

msg3	db 	"Ciego y perdido por el stress"
len2 	equ	$-msg3
