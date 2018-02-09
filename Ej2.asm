.data

.text
addi $s0, $zero, 3 # selector
addi $s1, $zero, 5 # A
addi $s2, $zero, 3 # B
addi $s3, $zero, 0 # C
addi $a0, $zero, 1 # Registro para comparar con selector (comienza en 1)

case1: 
	bne $a0, $s0, case2    #Si el selector es 1 continuo con el codigo, de otra forma salta al caso 2
	jal suma		#Va a la funcion suma y hace la operación
	j breik

case2:
	addi $a0, $a0, 1	
	bne $a0, $s0, case3	#Si el selector es 2 continuo con el codigo, de otra forma salta al caso 3
	jal resta		#Va a la funcion resta y hace la operación
	j breik
	
case3:
	addi $a0, $a0, 1	#Se le agrega 1 al 
	bne $a0, $s0, default	#Si el selector es 3 continuo con el codigo, de otra forma salta al default
	jal multiplica		#Va a la funcion multiplica y hace la operación
	j breik
	
default:
	jal andBitwise		#Va a la funcion andBitwise y hace la operación
	j breik

suma:
	add $s3, $s1,$s2     #Suma de a,b
	j breik
	jr $ra

resta:
	sub $s3, $s1, $s2   #resta de a,b
	j breik
	jr $ra

multiplica:
	mul $s3, $s1, $s2   #multiplicacion de a,b
	j breik
	jr $ra

andBitwise:
	and $s3, $s1, $s2    #and entre a,b
	jr $ra

breik:				#Salta al fin del programa
j fin


fin: