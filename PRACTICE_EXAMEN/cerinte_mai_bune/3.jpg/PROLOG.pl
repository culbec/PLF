exista([H | _], H) :- !.
exista([_ | T], E) :- exista(T, E).

adaugaSfarsit([], E, [E]).
adaugaSfarsit([H | T], E, [H | R]) :- adaugaSfarsit(T, E, R).

subm1([], []).
subm1([H | T], [H | R1]) :- 
  subm1(T, R1), 
  \+exista(R1, H), !.
subm1([_ | T], R) :- subm1(T, R).

subm2([], C, C).
subm2([H | T], C, R) :-
  exista(C, H),
  !,
  subm2(T, C, R).
subm2([H | T], C, R) :- 
  adaugaSfarsit(C, H, C1),
  subm2(T, C1, R).

candidat([H | _], H).
candidat([_ | T], E) :- candidat(T, E).

aranjamenteAux(_, K, S, A, K, S, A) :- !.
aranjamenteAux(L, K, S, A, KA, SA, R) :-
  KA =< K,
  SA =< S,
  candidat(L, E),
  \+candidat(A, E),
  KAT is KA + 1,
  SAT is SA + E,
  aranjamenteAux(L, K, S, [E | A], KAT, SAT, R).

aranjamenteStart(L, K, S, R) :-
  candidat(L, E),
  aranjamenteAux(L, K, S, [E], 1, E, R).

aranjamente(L, K, S, Rez) :-
  findall(R, aranjamenteStart(L, K, S, R), Rez),
  write(Rez).
