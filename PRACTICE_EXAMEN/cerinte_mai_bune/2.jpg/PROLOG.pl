suma1(N, 0) :- N =< 0, !.
suma1(N, S) :- N1 is N - 1, suma1(N1, S1), S is S1 + N.

suma2(N, S) :- N > 0, S is N * (N + 1) // 2.

candidat([H | _], H).
candidat([_ | T], E) :- candidat(T, E).

valid(N, S, NA, SA) :- NA < N, SA < S.

aranjamenteAux(_, N, S, A, N, S, A) :- !.
aranjamenteAux(L, N, S, A, NA, SA, Rez) :-
  valid(N, S, NA, SA),
  candidat(L, E),
  \+candidat(A, E),
  NAT is NA + 1,
  SAT is SA + E,
  aranjamenteAux(L, N, S, [E | A], NAT, SAT, Rez).

aranjamenteStart(L, N, S, Rez) :-
  candidat(L, E),
  aranjamenteAux(L, N, S, [E], 1, E, Rez).

aranjamente(L, N, S, Rez) :-
  findall(R, aranjamenteStart(L, N, S, R), Rez).
