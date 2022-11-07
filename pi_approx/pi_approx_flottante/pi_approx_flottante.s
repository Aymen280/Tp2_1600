.data
i:             
.float  0       # i
iteration:
.int 50     # Nombre d'itérations
x:
.float 2       
y:
.float 1
signe1:
.float 1
signe2:
.float -1
pi:             # Valeur du ratio de pi initial
.float 0
cte: 
.float 1
multiplicateur:
.float 4


.text
.globl pi_approx_flottante

pi_approx_flottante:

push %ebp       # Prologue
mov %esp,%ebp
push %ebx

#votre code

movl iteration, %ecx
addl $1, %ecx

L :
    flds x # 2 
    flds i # n dans st[0]
    fmulp # st[0] contient 2n et st[1] libere
    flds y #st[0] = 1 et st[1] 2i
    faddp # st[0] = 2i+1 st[1] libere
    flds y #st[0] = 1 et st[1] = 2i+1
    fdivp # st[0] = 1/2i+1 et st[1] libere

    #parite du signe
    movl %ecx, %eax
    subl $1, %eax
    movl $0, %edx
    movl $2 , %ebx
    divl %ebx
    cmpl $0, %edx
    je termePair
    retourPair:
    cmpl $1, %edx 
    je termeImpair
    retourImpair:

    fmulp #st[0] contient terme
    flds pi #st[0] = pi et st[1] = terme
    faddp  # st[0] contient pi st[1] libere
    fstps pi #enregistre pi 

    #incrementation de i 
    flds i 
    flds cte
    faddp 
    fstps i 

    subl $1, %ecx
    je fin
    jmp L

termePair :
    flds signe1 #st[0] contient 1
    jmp retourPair

termeImpair:
    flds signe2 #st[0] conitent -1
    jmp retourImpair

fin: 
    flds multiplicateur
    flds pi 
    fmulp

pop %ebx
pop %ebp
ret
