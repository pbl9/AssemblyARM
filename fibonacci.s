.data
type_a_number: .asciz "Type a number greater or equal 2:"
format: .asciz "%d"
.text

fibonacci:
	str lr, [sp, #-8]!
	str r0, [sp, #-8]! /*push n onto stack*/
	mov r0, #1 /*a_n*/
	mov r1, #1 /*a_n-1 */
	mov r3, #2 /*tmp*/
	loop:
		ldr r2, [sp] /*r2 has value n now*/
		cmp r3, r2
		bgt end_loop
		mov r2, r0
		add r0, r0, r1
		mov r1, r2
		add r3, r3, #1
		b loop
	end_loop:
	add sp, sp, #8
	ldr lr, [sp], #+8
	bx lr

.global main
main:
str lr, [sp, #-8]!
sub sp, sp, #8

ldr r0, addr_of_type_a_number
bl printf

ldr r0, addr_of_format
mov r1, sp
bl scanf

ldr r0, [sp]
bl fibonacci

mov r1, r0
ldr r0, addr_of_format
bl printf

add sp, sp, #+8
ldr lr, [sp], #+8
bx lr

addr_of_type_a_number: .word type_a_number
addr_of_format: .word format


