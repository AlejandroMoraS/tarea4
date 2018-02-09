.data
vector1: .word 1 2 3	#Declarar vector1
vector2: .word 6 7 8	#Declarar vector2
result: .word
k: .word 3		#Declarar los ciclos que se harán

.text

main: 
	add $t1, $zero, $zero	#Se le pasa un 0 a t1
	lw $t0, k		#Se pasa el valor del vector1 a t8
	la $t8, vector1		#Se pasa la dirección de memoria del vector1 a t8
	la $t9, vector2		#Se pasa la dirección de memoria del vector2 a t9

for: 
	beq $t0, $t1, fin	#Se compara 3 con t1 para contar los ciclos
	lw $s7, 0($t9)		#se pasa el valor de vector2 a s7
	lw $s6, 0($t8)		#se pasa el valor de vector1 a s6
	addi $t1, $t1, 1	#empieza un ciclo y se le agrega 1 a t1
	addi $t9, $t9, 4	#se pasa al siguiente valor del vector ya que van de 4 en 4
	addi $t8, $t8, 4	#se pasa al siguiente valor del vector ya que van de 4 en 4
	jal multAndAccumulate
	add $t4, $t4, $s0
	j for			#comienza otra vez el ciclo
		
multAndAccumulate:
	addi $sp, $sp, -16	#Stack, guarda los valores de los vectores y ra
	sw $s7, 8($sp)
	sw $s6, 4($sp)
	sw $ra, 0($sp)
	
	mul $s6,$s6,$s7		#Se realiza la multiplicación de los dos vectores
	add $s7,$zero,$a2	#Se suma 0 con a2
	jal Acumulate		#salta a acumulate
	add $s0, $zero, $s0
	
	lw $s7, 8($sp)
	lw $s6, 4($sp)
	lw $ra, 0($sp)		
	
	addi $sp, $sp, 16	#Fin del stack
	jr $ra
	
Acumulate: 
	add $s0, $zero, $zero	#s0 = 0 + 0
	add $s0, $s6,$s7	#en s0 se guarda la suma de vector1 y vector2
	jr $ra

fin:

