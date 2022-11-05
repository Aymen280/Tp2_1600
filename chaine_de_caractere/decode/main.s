.data
string1:
.ascii  "AazZWgFh tuvJKLYZHj" # Le message à decoder AazZWgFF donne une lettre ASCII, tuvJKLYZH donne l'autre. 
string2:
.ascii 

.text
.globl main

main : 
push %ebp
mov %esp,%ebp
push %ebx

#Votre code ici
pushl $string1, %esi



pop %ebx
pop %ebp
ret
