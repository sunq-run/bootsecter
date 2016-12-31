	.text
_start:
	.global _start
	.code16
	mov $0xe, %ah
	mov $0xe2e, %al
	xor %bh, %bh
	int $0x10


