.data
string1:
.ascii  "AazZWgFh tuvJKLYZHj/" # Le message à decoder AazZWgFF donne une lettre ASCII, tuvJKLYZH donne l'autre. 
resultat1:
.asciz ""
resultat2:
.asciz ""




.text
.globl main


#Result = "Hi"
main : 
push %ebp
mov %esp,%ebp
push %ebx

#Votre code ici



movl $string1, %esi
movl $0, %edx
movl $0, %ecx
movl $0, %eax
movl $0, %ebx
movl $10, %edi

segment1: 
    lodsb
    cmpb $' ', %al
    je segment2
    jmp calcul1
    retour1:
    jmp segment1


segment2: 
    lodsb
    cmpb $'/', %al #if al - / == 0 
    je affichage
    jmp calcul2
    retour2:
    jmp segment2

calcul1 :
    #al contient le code ascii d' un caractere
    movl $0, %edx
    cmpl $100, %eax #if eax -100 >0 --> eax > 100
    ja divisionCompose1
    retourDivComp1:
    divl %edi
    
    addl %eax, %ebx
    addl %edx, %ebx
    jmp retour1 

divisionCompose1:
    movl $100, %edi
    divl %edi

    addl %eax, %ebx

    movl $10, %edi
    movl %edx, %eax
    movl $0, %edx
    jmp retourDivComp1


divisionCompose2:
    movl $100, %edi
    divl %edi

    addl %eax, %ecx

    movl $10, %edi
    movl %edx, %eax
    movl $0, %edx
    jmp retourDivComp2



calcul2 : 
    movl $0, %edx
    cmpl $100, %eax #if eax -100 >0 --> eax > 100
    ja divisionCompose2
    retourDivComp2:
    divl %edi
    addl %eax, %ecx
    addl %edx, %ecx
    jmp retour2

affichage :
    
    movl %ebx, resultat1
    movl %ecx, resultat2
    pushl $resultat2
    pushl $resultat1
    call printf
    addl $8, %esp




pop %ebx
pop %ebp
ret
