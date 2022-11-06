.text
.globl pi_approx_entiere

pi_approx_entiere:
 #ebp pointe vers le bottom de la pile 
 #esp pointe vers le top de la pile  


push %ebp
mov %esp,%ebp
push %ebx

# VOTRE CODE 
movl 8(%ebp), %ecx  #a

movl $0, %esi
movl $0, %edx
movl $0, %ebx
movl $0, %edi
L1 :
    cmpl $0, %ecx
    je fin
    # cacul du denominateur
    movl %esi, %eax
    movl $2, %edx
    mull %edx
    addl $1, %eax
    movl %eax, %ebx
    #numerateur = 1
    movl $1, %eax

    movl $0, %edx
    divl %ebx
    
    addl %eax, %edi
    addl $1, %esi
    subl $1, %ecx
    jmp L1

fin: 
movl %edi, %eax  
movl $4, %edx
mull %edx

pop %ebx
pop %ebp
ret
