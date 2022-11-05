.data
string:
.asciz "My favourite number is FIFTEEN!\n"
resultat:
.asciz "" 


.text
.globl main


#on a une chaine en data 
# le but est d'iterer afin d'atteindre le 15 eme caractere et 
#si s'en est une lettre on laffiche
#lette >41 (65) < 7A(122)

comparaisonEntreZa:
cmpb $'a', %al
jb erreur #if al -a < 0 --> al < a
jmp afficher


main : 
push %ebp
mov %esp,%ebp
push %ebx

#votre code

cld #routine d'incrementation 
movl $string , %esi #string = tableau de char on prend a chaque fois un caratere 
lodsb
movl %eax, %edx # edx contient la premiere lettre 
movl $14, %ecx # compteur de loop
prochaineLettre: #etiquette qui va nous permettre d'iterer 
lodsb  #deplace la valeur en memoire esi dans eax
subl $1, %ecx
jne prochaineLettre # if edx == 0 on jump pas


cmpb $'A', %al
jb erreur # if al - A < 0 --> al < A
cmpb $'z', %al
ja erreur # if al - z > 0 --> al > z
cmpb $'Z', %al
ja comparaisonEntreZa #if al - Z > 0 --> al > Z

afficher:
movl %eax, resultat
pushl $resultat
call printf
addl $4, %esp
jmp fin

erreur: 
movl %edx, resultat
pushl $resultat
call printf
addl $4, %esp



fin:
popl %ebx
popl %ebp
ret
