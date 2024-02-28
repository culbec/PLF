% Permutari, combinari, aranjamente de produs P.

candidat([H | T], H, T).
candidat([_ | T], E, Rest) :- candidat(T, E, Rest).

lungime([], 0).
lungime([_ | T], N) :- lungime(T, N1), N is N1 + 1.

adaugaSfarsit([], E, [E]).
adaugaSfarsit([H | T], E, [H | R]) :- adaugaSfarsit(T, E, R).

permutariAux(_, N, P, Perm, N, P, Perm) :- !.
permutariAux(L, N, P, Perm, KPerm, PPerm, Rez) :-
  KPerm < N,
  PPerm < P,
  candidat(L, E, _),
  \+candidat(Perm, E, _),
  KPermT is KPerm + 1,
  PPermT is PPerm * E,
  permutariAux(L, N, P, [E | Perm], KPermT, PPermT, Rez).

permutariStart(L, N, P, Rez) :-
  candidat(L, E, _),
  permutariAux(L, N, P, [E], 1, E, Rez).

permutari(L, P, Rez) :-
  lungime(L, N),
  findall(R, permutariStart(L, N, P, R), Rez).

combinariAux(_, N, P, Comb, N, P, Comb) :- !.
combinariAux(L, N, P, Comb, KComb, PComb, R) :-
  KComb < N,
  PComb < P,
  candidat(L, E, Rest),
  KCombT is KComb + 1,
  PCombT is PComb * E,
  adaugaSfarsit(Comb, E, CombE),
  combinariAux(Rest, N, P, CombE, KCombT, PCombT, R).

combinariStart(L, N, P, R) :-
  candidat(L, E, Rest),
  combinariAux(Rest, N, P, [E], 1, E, R).

combinari(L, N, P, Rez) :- findall(R, combinariStart(L, N, P, R), Rez).

aranjamenteAux(_, N, P, Aranj, N, P, Aranj) :- !.
aranjamenteAux(L, N, P, Aranj, KAranj, PAranj, R) :-
  KAranj < N,
  PAranj =< P,
  candidat(L, E, _),
  \+candidat(Aranj, E, _),
  KAranjT is KAranj + 1,
  PAranjT is PAranj * E,
  aranjamenteAux(L, N, P, [E | Aranj], KAranjT, PAranjT, R).

aranjamenteStart(L, N, P, R) :-
  candidat(L, E, _),
  aranjamenteAux(L, N, P, [E], 1, E, R).

aranjamente(L, N, P, Rez) :- findall(R, aranjamenteStart(L, N, P, R), Rez).
