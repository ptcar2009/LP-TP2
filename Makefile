CC=g++
HC=ghc
ODIR=obj
HDIR=haskell
CDIR=cpp
BNAME=queens
BDIR=.

N_QUEENS ?= 8


all: haskell/build cpp/build

all/build: haskell/build cpp/build

all/init:
	@ [ -d "${ODIR}" ] || mkdir -p ${ODIR}

.PHONY: haskell/confirm_install
haskell/confirm_install:
	@echo -n "Isso instalara o ghc. Tem certeza que quer continuar? [y/N] " && read ans && [ $${ans:-N} = y ]

haskell/install: haskell/confirm_install
	@curl --proto '=https' --tlsv1.2 -sSf https://get-ghcup.haskell.org | sh

haskell/build: all/init ${HDIR}/Main.hs
	${HC} -o ${BDIR}/${BNAME}_haskell -outputdir ${ODIR} ${HDIR}/Main.hs

cpp/build: all/init ${CDIR}/main.cpp
	${CC} -o ${BDIR}/${BNAME}_cpp ${CDIR}/main.cpp

haskell/run:
	@${BDIR}/${BNAME}_haskell ${N_QUEENS}

cpp/run:
	@${BDIR}/${BNAME}_cpp ${N_QUEENS}



.PHONY: clean
clean:
	@rm -rf ${ODIR}/*
	@rm -rf ${BDIR}/${BNAME}*
