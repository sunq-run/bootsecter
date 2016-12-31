	.text
_start:
	.global _start
	.code16
	mov	$0xe, %ah
	mov	$0x47, %al
	movw	$1, %bx
	int 	$0x10
	
	mov	$0xe, %ah
	mov	$0x52, %al
	movw	$1, %bx
	int 	$0x10


