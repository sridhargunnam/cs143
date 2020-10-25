ASSN = 1
CLASS= cs143
CLASSDIR= /usr/class/cs143/cool
SRC= input.cl README
LSRC= Makefile input.test
MYLEXER=./mylexer
REFLEXER=${CLASSDIR}/bin/reflexer
DIFFTOOL=/usr/bin/tkdiff

CC=gcc
CFLAGS=-g

.c.o:
	${CC} ${CFLAGS} -c $<

build: ${MYLEXER} compile

lex: build
	@${MYLEXER} input.cl

source : lsource
	${CLASSDIR}/etc/copy-skel ${ASSN} ${SRC}

lsource:
	${CLASSDIR}/etc/link-shared ${ASSN} ${LSRC}

compile: input.s

input.s: input.cl
	${CLASSDIR}/bin/coolc input.cl

test:	compile
	@echo input.test
	${CLASSDIR}/bin/spim -file input.s < input.test

clean :
	rm -f *.s core *~ mylexer *.o
	echo "" > my_outs/

# Custom targets added for PA1
lex.yy.c: cool.flex
	flex cool.flex

yylex.o: lex.yy.c
	g++ --std=c++11 -c -o yylex.o lex.yy.c

${MYLEXER}: yylex.o MyLexHelper.h MainFlex.cpp
	g++ --std=c++11 -c -o ./MainFlex.o MainFlex.cpp
	g++ --std=c++11 -o ${MYLEXER} ./MainFlex.o ./yylex.o

reflex:
	echo "" > ref_outs/input_lex.rpt
	${REFLEXER} input.cl > ref_outs/ref_input_lex.rpt

mylex: ${MYLEXER}
	echo "" > my_outs/input_lex.rpt
	${MYLEXER}  input.cl > my_outs/my_input_lex.rpt

difflex: ${MYLEXER}
	${REFLEXER} input.cl > ref_outs/ref_input_lex.rpt
	${MYLEXER}  input.cl > my_outs/my_input_lex.rpt
	${DIFFTOOL} ref_outs/ref_input_lex.rpt my_outs/my_input_lex.rpt

