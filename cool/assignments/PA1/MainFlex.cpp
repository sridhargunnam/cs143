#include <iostream>
#include <string>
#include <cstdio>
#include <cstdint>
#include <cstdlib>
#include "MyLexHelper.h"

extern int yylex();
extern FILE *yyin;
extern void MyLexer();

int main( int argc, char **argv ) {

    ++argv, --argc;  /* skip over program name */

    std::string first_line;
    if ( argc > 0 ) {
        yyin = fopen(argv[0], "r");
        first_line = "#name \"" + std::string{argv[0]} + "\"";
    }
    else {
        yyin = stdin;
    }

    std::cout << first_line << "\n";
    yylex();
    MyLexer();

    exit(EXIT_SUCCESS);
}
