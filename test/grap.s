	.text
_start:
	.global _start
	.code16
	xor %ah, %ah
	mov $0x12, %al
	int $0x10

	mov $0x0c, %ah
	mov $0x100, %cx
	mov $0x100, %dx
	mov $0x02, %al
	int $0x10

dline:
	int $0x10
	dec %cx
	dec %dx
	call dline




