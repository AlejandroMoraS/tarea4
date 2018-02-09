.data

.text

add $a0, $zero, $zero #Declaración de a y b
add $a1, $zero, $zero
add $t9, $zero, $zero 
_tmain:
	addi $s0, $zero, 1 #registro counter
	addi $s1, $zero, 0 #registro variable

do:
	add $a0, $zero, $s0 #se pasa lo que tiene counter a A
	add $a1, $zero, $s0 #se pasa lo que tiene counter a b
	jal Suma		#se hace la funcion de sumar counter con counter
	div $s1, $s0, 4		#se divide counter entre 4
	slti $t9,$s1,20		#si es mayor a 20 se guardara un 1
	beq $t9,1,do		#si es diferente a 1 se seguira ciclando
	j fin

Suma:
	add $a2, $zero, $zero
	add $a2, $a0, $a1	#se realiza la suma de a y b que se guarda en c
	add $s0, $a2,$zero	# se pasa el valo de c a s0
	jr $ra			#regresa a la funcion
 fin:

	
