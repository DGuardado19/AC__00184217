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
        mov bl, 01000000b
        mov	cx, 1h
        int	10h
        ret

kbwait: mov ax, 0000h
        int 16h
        ret

cursor1:mov ah, 02h
        mov dx, di  ; columna
        ADD	dl, 43d ;off columna
        mov dh, 17d ; fila
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
msg	    db 	"GATO"
len 	equ	$-msg
