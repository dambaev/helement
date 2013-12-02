
#include "test.h"
#include "stdio.h"
void
    test( char * ptr, int sz_ptr)
{
    FILE * f = 0;
    printf("printing %s\n", ptr);
    f = fopen("test.txt", "wb");
    fwrite(ptr, 1, sz_ptr, f);
    fclose( f); 
}
