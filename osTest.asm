GDT_Start:
    null_descriptor:
        dd 0    ;four times 00000000
        dd 0    ;four times 00000000

    code_descriptor:
        dw 0xffff
        dw 0
        db 0
        db 10011010 ;magic
        db 11001111 ;more magic
        db 0
    
    data_descriptor:
        dw 0xffff
        dw 0
        db 0
        db 10010010 ;magic
        db 11001111 ;more magic
        db 0
GDT_End:

GDT_Descriptor:
    dw GDT_End - GDT_Start - 1
    dd GDT_Start

CODE_SEG equ code_descriptor - GDT_Start    ;constants
DATA_SEG equ data_descriptor - GDT_Start

cli
lgdt [GDT_Descriptor]
mov eax, cr0
or eax, 1
mov cr0, eax