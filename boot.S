.section .text

.global _start

_start:
    mrs     x1,mpidr_el1
    and     x1,x1,#3
    cbz     x1,2f

1:  wfe
    b       1b

2: 
    ldr     x1,=_start
    mov     sp,x1          // Initialize stack pointer (you may want to adjust this)

    ldr     x1,=__bss_start
    ldr     x2,=__bss_end
    sub     x2,x2,x1        // Calculate size of .bss section

3:  cbz     w2, 4f
    str     xzr,[x1],#8
    sub     w2,w2, #1
    cbnz    w2, 3b

4:  bl      main
    b       1b
