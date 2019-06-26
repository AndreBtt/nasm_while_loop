#include <stdio.h>

#include "cdecl.h"

void PRE_CDECL while_loop ( int, int ) POST_CDECL; /* prototype for assembly routine */

int main() {
    while_loop(0, 5);
    return 0;
}