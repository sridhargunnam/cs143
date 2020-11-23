%{
#include <string>
#include <iostream>
#include <cstdio>
#include <cmath>
int line_count = 0, char_count = 0;
extern void fillLineKeywords(int line_no, std::string identifier);
%}

/* Begin of Definitions */
DIGIT          [0-9]
TYPEID         [A-Z][a-z0-9]\(\)
OBJECTID       [a-z][a-z0-9]
ONE_LINE_COMMENT        \(\*.*\*\)
COMMENT_BEGIN   \(\*.*
COMMENT_MID     [^)]*
COMMENT_END     .*\*\)
KEYWORD        (class)

STRING \"[^\n"]+\"
MULTI_LINE_COMMENT_STRING [^\n]+
WHITESPACE [ \t]+

/* Definitions of Definitions */

%option noyywrap
%option yylineno

%%
\n      ++line_count; ++char_count;
.       ++char_count;

<STRING>[^"]*   {
   std::cout << "found a string at line " <<  line_count << " " << yytext << "\n";
}

{ONE_LINE_COMMENT} {
    std::cout << "I saw a comment : "  << yytext  << "\n";
}

<COMMENT_BEGIN>{MULTI_LINE_COMMENT_STRING},COMMENT_END {
    std::cout << "multi Line comment here : " << yytext << "\n";
}

{COMMENT_END} {
    std::cout << "comment ends here : " << yytext << "\n";
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