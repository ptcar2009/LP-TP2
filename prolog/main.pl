#!/usr/bin/env swipl

solucoes(N,Qs) :- menor(1,N,Rs), combinacoes(Rs,Qs), nao_ataca(Qs).

nao_ataca(Qs) :- nao_ataca(Qs,1,[],[]).
nao_ataca([],_,_,_).
nao_ataca([Y|Ys],X,Cs,Ds) :- 
	C is X-Y, \+ member(C,Cs),
	D is X+Y, \+ member(D,Ds),
	X1 is X + 1,
	nao_ataca(Ys,X1,[C|Cs],[D|Ds]).

menor(A,A,[A]).
menor(A,B,[A|L]) :- A < B, A1 is A+1, menor(A1,B,L).

combinacoes([],[]).
combinacoes(Qs,[Y|Ys]) :- del(Y,Qs,Rs), combinacoes(Rs,Ys).

del(X,[X|Xs],Xs).
del(X,[Y|Ys],[Y|Zs]) :- del(X,Ys,Zs).

:- initialization(main, main).

print([]).
print([X|Xs]) :- write(X), write('\n'), print(Xs).

main(Argv) :-
	concat_atom(Argv, ' ', SingleArg),
	term_to_atom(Term, SingleArg),
	Val is Term,
	findall(X, solucoes(Val , X), L),
	print(L).
