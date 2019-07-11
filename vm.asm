	global main

	section .rodata
yes:	db "VM!", 10
yeslen:	equ $-yes
no:	db "Not VM!", 10
nolen:	equ $-no

	section .text
main:
	mov rax, 1
	cpuid
	bt rcx, 0x1f
	jc is_vm
	mov rsi, no
	mov rdx, nolen
	jmp print
is_vm:
	mov rsi, yes
	mov rdx, yeslen
print:
	mov rax, 1
	syscall
exit:
	mov rdi, 0
	mov rax, 60
	syscall
