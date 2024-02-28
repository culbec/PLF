candidat([H | _], H).
candidat([_ | T], E) :- candidat(T, E).

lungime([], 0).
lungime([_ | T], N) :- lungime(T, N1), N is N1 + 1.

adaugaSfarsit([], E, [E]).
adaugaSfarsit([H | T], E, [H | R]) :- adaugaSfarsit(T, E, R).

permutariAux(_, N, _, _, P, N, P) :- !.
permutariAux(L, N, Ratie, Ultim, P, K, Rez) :-
  K < N,
  candidat(L, E),
  \+candidat(P, E),
  Ratie is E - Ultim,
  KT is K + 1,
  adaugaSfarsit(P, E, PT),
  permutariAux(L, N, Ratie, E, PT, KT, Rez).

permutariStart(L, N, Rez) :-
  candidat(L, H1),
  candidat(L, H2),
  H1 \= H2,
  Ratie is H2 - H1,
  permutariAux(L, N, Ratie, H2, [H1, H2], 2, Rez).

permutari(L, Rez) :-
  lungime(L, N),
  findall(R, permutariStart(L, N, R), Rez),
  write(Rez).

aranjamenteAux(_, N, _, _, A, N, A) :- !.
aranjamenteAux(L, N, Ratie, Ultim, A, K, R) :-
  K < N,
  candidat(L, E),
  \+candidat(A, E),
  Ratie is E - Ultim,
  KT is K + 1,
  adaugaSfarsit(A, E, AT),
  aranjamenteAux(L, N, Ratie, E, AT, KT, R).

aranjamenteStart(L, N, R) :-
  candidat(L, E1),
  candidat(L, E2),
  E1 \= E2,
  Ratie is E2 - E1,
  aranjamenteAux(L, N, Ratie, E2, [E1, E2], 2, R).

aranjamente(L, N, Rez) :-
  findall(R, aranjamenteStart(L, N, R), Rez), write(Rez).

