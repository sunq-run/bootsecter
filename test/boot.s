	.text
_start:
	.global _start
	.code16
	call	hello
message:
	.ascii	"Hello World\r\n"
hello:	
	lea	$message, %si
	call 	print
	cli

print:
	lodsb
	or 	%al, %al
	jz 	.done
	mov 	$0x0e, %ah
	int 	$0x10
	jmp 	print 

.done:
	ret
