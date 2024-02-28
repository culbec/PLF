putere1(_, N, 1) :- N =< 0, !.
putere1(X, N, R) :- N1 is N - 1, putere1(X, N1, R1), R is R1 * X.

putere2(_, N, 1) :- N =< 0, !.
putere2(X, N, R) :- N mod 2 =:= 0, !, N1 is N // 2, putere2(X, N1, R1), R is R1 * R1.
putere2(X, N, R) :- N1 is N - 1, putere2(X, N1, R1), R is R1 * X.

candidat([H | _], H).
candidat([_ | T], E) :- candidat(T, E).

nrElem([], 0) :- !.
nrElem([_ | T], R) :- nrElem(T, R1), R is R1 + 1.

permutari(_, N, P, K, P) :- K =:= N, !.
permutari(L, N, [PH | PT], K, Rez) :-
  candidat(L, E),
  \+candidat([PH | PT], E),
  abs(E - PH) =< 3,
  KT is K + 1,
  permutari(L, N, [E, PH | PT], KT, Rez).

permutariStart(L, N, Rez) :-
  candidat(L, E),
  permutari(L, N, [E], 1, Rez).

permutariCollect(L, Rez) :-
  nrElem(L, N),
  findall(R, permutariStart(L, N, R), Rez).
