org	100h
section .text
        call    texto
        call    cursor
        call    phrase
	xor     si, si   
inicio: cmp     si, 4d
        je      suma
        call 	kbwait
        cmp     si, 1d
        je      mas
        cmp     al, "S"
        je      igual
        mov	[300h+si], al
	inc 	si
        jmp     printverde

mas:    mov    cl, "+"
        mov	[300h+si], cl
        inc    si
        mov	[300h+si], al
        inc    si
        jmp    printverde

igual:  mov     cl, "="
        mov     [300h+si], cl
        inc     si
        jmp     printverde

suma:   mov     al, [300h]
        add     al, [302h]
        sub     al, 30h
        mov     cl, 39h
        cmp     al, cl
        ja      dosdigitos
        cmp     al, cl
        jb      undigito
        ret

undigito:       mov     [300h+si], al
        inc     si
        jmp     printazul
dosdigitos:  mov     cl, 31h
        mov     [300h+si], cl
        inc     si
        sub     al, 0Ah
        mov     [300h+si], al
        inc     si
       jmp     printazul

printverde:call    w_strng
        cmp     si, 4d
        jbe     inicio

printazul:call    w_strng2
        int 20h

texto:	mov 	ah, 00h
	mov	al, 03h
	int 	10h
	ret

kbwait: mov	ah, 00h 
        int 	16h	
        ret			

w_strng:mov     ah, 13h
        mov     al, 01h 
        mov     bh, 00h 
        mov     bl, 00101110b
        mov     cx, si
        mov     dl, 30d
        mov     dh, 15d	
        push    cs 
        pop     es
        mov     bp, 300h
        int     10h
        ret

w_strng2:
        xor     si, si
        mov     si, 2d
        mov     ah, 13h
        mov     al, 01h 
        mov     bh, 00h 
        mov     bl, 01110001b
        mov     cx, si
        mov     dl, 35d
        mov     dh, 15d	
        push    cs 
        pop     es
        mov     bp, 304h
        int     10h
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
        mov     dx, di  ; columna
        ADD     dl, 5d ;off columna
        mov     dh, 2d ; fila
        mov     bh, 0h
        int     10h
        ret

phrase: mov     di, 0d
aux1:  mov     cl, [msg+di]
        call    m_cursr
        call    w_char
        inc     di
        cmp     di, len
        jb      aux1
        ret


section .data

msg     db      "Primer dato de la suma: "
len     equ     $-msg

Select e.FistName as nombre, sum(o.UnitPrice*o.Quantity), o.OrderDate as Mes
From Employee e, Order o
Where o.EmployeeID= e.EmployeeID
Group by nombre, mes;


SELECT pro.ProductName, cat.CategoryName, ord.Freight, cus.Country, cus.ContactName, ord.OrderDate 
from Categories cat
inner join Products pr  on cat.CategoryID = pro.CategoryID
inner join [Order Details] orDe on pro.ProductID = orDe.ProductID
inner join Orders ord on orDe.OrderID = ord.OrderID
inner join Customers cus on ord.CustomerID = cus.CustomerID
inner join Employees emp on ord.EmployeeID = emp.EmployeeID
where ord.OrderDate between '1996-01-01 00:00:00.000' and '1999-01-01 00:00:00.000'

Determinar las ventas de sus productos en los 2 últimos años en las distintas
regiones geográficas según la categoría a la que pertenece cada producto.

SELECT p.ProductName, p.CategoryName, p.Freight, c.Country, c.ContactName, o.OrderDate 
from Orders as o
inner join Product as p on o.id_Producto = p.id_Producto
inner join Employee as e on e.id_emplo = o.id_emplo
inner join Customerst as c on c.id_customer = o.id_customer
inner join Time as t on t.id_tiempo = o.id_tiempo
where ord.OrderDate between '1996-01-01' and '1998-12-31'


b) Evaluar los lugares con las ventas más altas en los 2 últimos años
c) Presentar cuáles han sido los 5 mejores clientes en los dos últimos años.