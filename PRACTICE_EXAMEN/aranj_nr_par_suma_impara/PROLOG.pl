candidat([H | _], H).
candidat([_ | T], E) :- candidat(T, E).

aranjamenteAux(_, A, K, S, A) :- K mod 2 =:= 0, S mod 2 =:= 1.
aranjamenteAux(L, A, K, S, R) :-
    candidat(L, E),
    \+candidat(A, E),
    KT is K + 1,
    ST is S + E,
    aranjamenteAux(L, [E | A], KT, ST, R).

aranjamenteStart(L, R) :-
    candidat(L, E),
    aranjamenteAux(L, [E], 1, E, R).

aranjamente(L, Rez) :- findall(R, aranjamenteStart(L, R), Rez).