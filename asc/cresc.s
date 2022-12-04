.data

	input:.asciz "%ld"
	output1:.asciz "DA"
	output2:.asciz "NU, se intrerupe la pasul %ld"
	n:.space 4
	v:.space 100
	i:.space 4

.text
.global main
main:
	pusha
	pushl $n
	pushl $input
	call scanf
	popa
	mov $0, %ecx
	lea v, %edi

loop1:
	cmp n, %ecx
	je tranz
	pusha
	pushl $i
	pushl $input
	call scanf
	pop %ebx
	pop %ebx
	popa
	mov i, %eax
	mov %eax, (%edi, %ecx, 4)
	inc %ecx
	jmp loop1

tranz:
	xor %ecx, %ecx
	xor %ebx, %ebx
	jmp loop2


loop2:
	cmp n, %ecx
	je exit1
	cmp (%edi, %ecx, 4),%ebx
	jg exit2
	mov (%edi, %ecx, 4),%ebx
	inc %ecx
	jmp loop2

exit1:
	pusha
	pushl $output1
	call printf
	popl %ebx
	pushl $0
	call fflush
	popl %ebx

	mov $1, %eax
	xor %ebx, %ebx
	int $0x80

exit2:
	pusha
	pushl %ecx
	pushl $output2
	call printf
	popl %ebx
	popl %ebx
	pushl $0
	call fflush
	popl %ebx
	mov $1, %eax
	xor %ebx, %ebx
	int $0x80




