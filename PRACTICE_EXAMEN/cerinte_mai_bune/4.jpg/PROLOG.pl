reverseListAux([], C, C) :- !.
reverseListAux([H | T], C, R) :-
  number(H),
  !,
  reverseListAux(T, [H | C], R).
reverseListAux([H | T], C, R) :-
  reverseListAux(H, [], CH),
  reverseListAux(T, [CH | C], R).

reverseList(L, R) :- reverseListAux(L, [], R).

candidat([H | T], H, T).
candidat([_ | T], E, Rest) :- candidat(T, E, Rest).

adaugaSfarsit([], E, [E]).
adaugaSfarsit([H | T], E, [H | R]) :- adaugaSfarsit(T, E, R).

submultimiAux(_, N, S, N, S) :- !.
submultimiAux(L, N, S, K, R) :-
  K < N,
  candidat(L, E, Rest),
  KS is K + 1,
  adaugaSfarsit(S, E, SS),
  submultimiAux(Rest, N, SS, KS, R).

submultimiStart(L, N, R) :-
  candidat(L, E, Rest),
  submultimiAux(Rest, N, [E], 1, R).

submultimi(L, N, Rez) :-
  findall(R, submultimiStart(L, N, R), Rez).
  
