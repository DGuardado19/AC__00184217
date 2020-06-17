                org 100h 
                mov ax, 0d
                add ax, 8d
                add ax, 4d
                add ax, 2d
                add ax, 1d
                add ax, 7d
                mov bx, 5d
                div bx
;resultado 4, me recupero
                mov cl, "M"
                mov [200h], cl
                mov cl, "e"
                mov [201h], cl
                mov cl, "r"
                mov [203h], cl
                mov cl, "e"
                mov [204h], cl
                mov cl, "c"
                mov [205h], cl
                mov cl, "u"
                mov [206h], cl
                mov cl, "p"
                mov [207h], cl
                mov cl, "e"
                mov [208h], cl
                mov cl, "r"
                mov [209h], cl
                mov cl, "o"
                mov [20Ah], cl
 ;ejercicio 2 Nukele

                mov ax, 0d
                mov bx, 0d
                mov si, 0d
                mov ax, 4d; dia 3 tendra 4 casos, dia desde el cual se pide la sucesion 
                mov bx, 2d; la constante de crecimiento 

unacelda:       mov [si+210h],ax; 210->4 si=0, si=1, 211h ax=8, si=2 212h ax=16 ,, 32, 64, 128, 256
                mul bx;Multiplica sin considerar el signo, el registro acumulador (AX o AL) por el operando proporcionado
                inc si
                cmp ax, 255d; calculando para las que necesitan 1 celda
                jbe unacelda

dosceldas:      mov [si+210h],ax
                mul	bx
                inc	si
                inc si
                cmp si,16d; cantidad de celdas hexa en decimal
                jne	dosceldas
                
;ejercicio 3 fibo

                mov ax, 0d
                mov bx, 0d
                mov bx, 1d
                mov dx, 0d
                mov si, 0d

unaceldafibo:   mov [si+220h], ax
                add ax,bx
                mov	cx,ax
                mov ax,bx
                mov bx,cx
                inc	si
                cmp	ax, 255d; calculando para las que necesitan 1 celda
                jbe	unaceldafibo

dosceldafibo:   mov [si+220h], ax
                add ax,bx
                mov	cx,ax
                mov ax,bx
                mov bx,cx
                inc	si
                inc si
                cmp	si, 16d; calculando para las que necesitan 1 celda
                jne dosceldafibo

                int 20h