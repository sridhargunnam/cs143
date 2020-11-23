%{
#include <iostream>
int line_count = 0, char_count = 0;
extern void fillLineKeywords(int line_no, std::string identifier);
%}

/* Begin of Definitions */
STRING_BODY [^"]*

/* Definitions of Definitions */

%option noyywrap
%option yylineno

%%
{STRING}   {
   std::cout << "found a string at line " <<  line_count << " " << yytext << "\n";
}

.   ;

%%

void MyLexer(){
}