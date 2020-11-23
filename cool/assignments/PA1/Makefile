ASSN = 1
CLASS= cs143
CLASSDIR= /usr/class/cs143/cool
SRC= input.cl
LSRC= Makefile input.test
MYLEXER_EXECUTABLE=./mylexer_executable
REFLEXER_EXECUTABLE=${CLASSDIR}/bin/reflexer
DIFFTOOL=/usr/bin/tkdiff
FLEX?= cool.flex

CC=gcc
CFLAGS=-g

.c.o:
	${CC} ${CFLAGS} -c $<

build: ${MYLEXER_EXECUTABLE} compile

lex: build
	@${MYLEXER_EXECUTABLE} ${SRC}

source : lsource
	${CLASSDIR}/etc/copy-skel ${ASSN} ${SRC}

lsource:
	${CLASSDIR}/etc/link-shared ${ASSN} ${LSRC}

compile: input.s

input.s: ${SRC}
	${CLASSDIR}/bin/coolc ${SRC}

test:	compile
	@echo input.test
	${CLASSDIR}/bin/spim -file input.s

clean :
	rm -f *.s *.o mylexer_executable lex.yy.c

# Custom targets added for PA1
lex.yy.c: ${FLEX}
	flex ${FLEX}

yylex.o: lex.yy.c
	g++ --std=c++11 -c -o yylex.o lex.yy.c

${MYLEXER_EXECUTABLE}: yylex.o MyLexHelper.h MainFlex.cpp
	g++ --std=c++11 -c -o ./MainFlex.o MainFlex.cpp
	g++ --std=c++11 -o ${MYLEXER_EXECUTABLE} ./MainFlex.o ./yylex.o

reflex:
	echo "" > ref_outs/input_lex.rpt
	${REFLEXER_EXECUTABLE} ${SRC} > ref_outs/ref_input_lex.rpt

mylex: ${MYLEXER_EXECUTABLE}
	echo "" > my_outs/input_lex.rpt
	${MYLEXER_EXECUTABLE}  ${SRC} > my_outs/my_input_lex.rpt
	#grep "(*" my_outs/my_input_lex.rpt

difflex: ${MYLEXER_EXECUTABLE}
	${REFLEXER_EXECUTABLE} ${SRC} > ref_outs/ref_input_lex.rpt
	${MYLEXER_EXECUTABLE}  ${SRC} > my_outs/my_input_lex.rpt
	${DIFFTOOL} ref_outs/ref_input_lex.rpt my_outs/my_input_lex.rpt

