ASSN = 1
CLASS= cs143
CLASSDIR= /usr/class/cs143/cool
SRC= stack.cl README
LSRC= Makefile atoi.cl stack.test
TGT=./MyLexer

CC=gcc
CFLAGS=-g

.c.o:
	${CC} ${CFLAGS} -c $<

build: ${TGT} compile

lex: build
	@${TGT} stack.cl

source :	lsource
	${CLASSDIR}/etc/copy-skel ${ASSN} ${SRC}

lsource:
	${CLASSDIR}/etc/link-shared ${ASSN} ${LSRC}

compile: stack.s

stack.s: stack.cl atoi.cl
	${CLASSDIR}/bin/coolc stack.cl atoi.cl

test:	compile
	@echo stack.test
	${CLASSDIR}/bin/spim -file stack.s < stack.test

clean :
	rm -f *.s core *~ My* *.o

lex.yy.c: cool.flex
	flex cool.flex

yylex.o: lex.yy.c
	g++ --std=c++11 -c -o yylex.o lex.yy.c

${TGT}: yylex.o MainFlex.cpp
	g++ --std=c++11 -c -o ./MainFlex.o MainFlex.cpp
	g++ --std=c++11 -o ${TGT} ./MainFlex.o ./yylex.o