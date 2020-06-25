org 	100h

section .text

	call 	grafico	

	xor 	si, si
	xor 	di, di

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

    mov 	si, 15d 
	mov 	di, 30d 
    mov     bx, 150d
	call 	linea_v


    mov 	si, 35d 
	mov 	di, 30d 
    mov     bx, 130d
	 call 	linea_v



 	mov 	si, 90d 
	mov 	di, 130d 
    mov     bx, 150d
	call 	linea_v



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

    mov 	si, 15d 
	mov 	di, 150d 
    mov     bx, 90d
	call 	linea_h

	mov 	si, 15d 
	mov 	di, 30d 
    mov     bx, 35d
	call 	linea_h

	mov 	si, 35d ;x
	mov 	di, 130d ;y
    mov     bx, 90d
	call 	linea_h


	call 	kb		

	int 	20h

grafico:mov	ah, 00h
	mov	al, 13h
	int 	10h
	ret

pixel:	mov	ah, 0Ch
	mov	al, 0010b
	int 	10h
	ret

linea_h: 
lupi_h:	mov 	cx, 0d 
	add 	cx, si
	mov	    dx, di 
	call 	pixel
	inc 	si
	cmp 	si, bx
	jne 	lupi_h
	ret

linea_v:
lupi_v:	mov 	cx, si 
	mov	dx, 0d 
	add 	dx, di
	call 	pixel
	inc 	di
	cmp 	di, bx
	jne 	lupi_v
	ret


kb: 	mov	ah, 00h
	int 	16h
	ret

section .data