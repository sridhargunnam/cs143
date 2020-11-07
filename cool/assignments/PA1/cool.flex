%{
#include <string>
#include <iostream>
#include <cstdio>
#include <cmath>
int num_lines = 0, num_chars = 0;
extern void fillLineKeywords(int line_no, std::string identifier);

%}

/* Begin of Definitions */
DIGIT          [0-9]
TYPEID         [A-Z][a-z0-9]\(\)
OBJECTID       [a-z][a-z0-9]
COMMENT_BEGIN  "\(\*"
COMMENT_END    \)\*
COMMENT        \(\*[\n|\t|\s|\r|.]*\*\)
KEYWORD        (class)
/* Definitions of Definitions */

%option noyywrap
%option yylineno


%%
\n      ++num_lines; ++num_chars;
.       ++num_chars;

{COMMENT} {
    std::cout << yytext ;
}

{KEYWORD} {
    fillLineKeywords(yylineno, yytext);
}

{TYPEID}   {
    std::cout << "#" << yylineno << " " << "TYPEID" << yytext << "\n";
}
%%

void MyLexer(){
}