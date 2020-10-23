%{
/* need this for the call to atof() below */
#include <math.h>
int num_lines = 0, num_chars = 0;
%}

DIGIT          [0-9]
TYPEID         [A-Z][a-z0-9]*
OBJECTID       [a-z][a-z0-9]*

/* TODO Come up with the custum output format but still aligning with cool compiler. Reason : Source tracking */
/* TODO Exclude matching any extra starting and ending comments in cool */
COMMENT        \(\*[.^\*\)]\*\)
()
%option noyywrap

%%
\n      ++num_lines; ++num_chars;
.       ++num_chars;
%%