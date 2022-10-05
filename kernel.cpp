extern "C" void WriteCharacter(unsigned char c, int forecolour, int backcolour, int x, int y)
{
    short attrib = (backcolour << 4) | (forecolour & 0x0F);
    volatile short * where;
    where = (volatile short *)0xB8000 + (y * 80 + x) ;
    *where = c | (attrib << 8);
}

extern "C" void main(){
    char str[] = "Hello World!";

    for (short i = 0; i < sizeof(str); i++)
    {
        WriteCharacter(str[i], 7, 0, i+1, 1);
    }

    return;
}