org	100h

section .text
        call    texto
        call    cursor
        call    phrase
        mov     cl, "R" 
        mov     [200h], cl
        mov     cl, "O" 
        mov     [201h], cl
        mov     cl, "O" 
        mov     [202h], cl
        mov     cl, "T" 
        mov     [203h], cl
        mov     cl, "T" 
        mov     [204h], cl
        xor 	si, si
        xor     di, di
        call    inicio
        ret
error:  call    texto
        call    cursor
        call    phrase2
        xor 	si, si
        xor     di, di
        call    inicio

inicio:	call    kbwait
	    cmp     al, "E"
        je	    valida
        mov	    [300h+si], al
        inc 	si
        jmp 	inicio
        ret

valida: mov     dl, [200h+di]
        cmp     dl, [300h+di]
        jne     error
        inc     di
        cmp     di, 5d
        jne     valida
        call    correct
        ret

correct:call    texto
        call    cursor
        call    phrase3
        int     20h

texto:	mov     ah, 00h
        mov	    al, 03h
        int 	10h
        ret

kbwait: mov	ah, 00h 
        int 	16h	
        ret		

cursor: mov     ah, 01h
        mov     ch, 00000000b
        mov     cl, 00001110b
        int     10h
        ret

w_char:	mov 	ah, 09h
        mov 	al, cl
        mov 	bh, 0h
        mov 	bl, 00001111b
        mov 	cx, 1h
        int 	10h
        ret

m_cursr:mov     ah, 02h
        mov dx, di  ; columna
        ADD	dl, 5d ;off columna
        mov dh, 2d ; fila
        mov bh, 0h
        int 10h
        ret

phrase: mov     di, 0d
aux1:  mov     cl, [msg+di]
        call    m_cursr
        call    w_char
        inc     di
        cmp     di, len
        jb      aux1
        ret

phrase2:mov     di, 0d
aux2:  mov     cl, [msg2+di]
        call    m_cursr
        call    w_char
        inc     di
        cmp     di, len2
        jb      aux2
        ret

phrase3:mov     di, 0d
aux3:  mov     cl, [msg3+di]
        call    m_cursr
        call    w_char
        inc     di
        cmp     di, len3
        jb      aux3
        ret

section .data

msg     db      "Ingrese contrasnia de 5 letras y oprima E para validar "
len 	equ	$-msg
msg2    db      "Wrong pass try again, 5 letras y oprima E"
len2 	equ	$-msg2
msg3    db      "BIENVENIDO"
len3 	equ	$-msg3