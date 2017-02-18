# bootsecter-prog

(1) Write assembler
	For exampls,
```python:hello.s
	.text
_start:
	.global _start
	.code16
	push	%cs
	pop	%es
	call	label1
message:
	.ascii	"Hello World\r\n"
label1:
	mov 	$3, %ah
	xor	%bh, %bh
	int	$0x10
	
	pop	%bp
	mov	$13, %cx
	mov	$0x0007, %bx
	mov	$0x1301, %ax
	int 	$0x10

	xor	%ah, %ah
	int	$0x19
```
save as hello.s

(2)python otegami2bootsec.py boot.s sunq.iso
Making iso file..

(3)./autostart.sh [boxname] sunq.iso
This is automaticaly emulate script on VirtualBox

Have fun!
