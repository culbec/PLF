candidat([H | _], H).
candidat([_ | T], E) :- candidat(T, E).

aranjamenteAux(_, K, P, A, K, P, A) :- !.
aranjamenteAux(L, K, P, A, KA, PA, R) :-
  KA < K,
  PA < P,
  candidat(L, E),
  \+candidat(A, E),
  KAT is KA + 1,
  PAT is PA * E,
  aranjamenteAux(L, K, P, [E | A], KAT, PAT, R).

aranjamenteStart(L, K, P, R) :-
  candidat(L, E),
  aranjamenteAux(L, K, P, [E], 1, E, R).

aranjamente(L, K, P, Rez) :-
  findall(R, aranjamenteStart(L, K, P, R), Rez),
  write(Rez).

