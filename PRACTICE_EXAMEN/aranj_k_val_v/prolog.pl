candidat([H | _], H).
candidat([_ | T], E) :- candidat(T, E).

aranjamenteAux(_, K, V, A, VA, K, A) :- VA < V, !.
aranjamenteAux(L, K, V, A, VA, KA, R) :-
    KA < K,
    VA < V,
    candidat(L, E),
    \+candidat(A, E),
    KAT is KA + 1,
    VAT is VA * E,
    aranjamenteAux(L, K, V, [E | A], VAT, KAT, R).

aranjamenteStart(L, K, V, R) :-
    candidat(L, E),
    aranjamenteAux(L, K, V, [E], E, 1, R).

aranjamente(L, K, V, Rez) :- findall(R, aranjamenteStart(L, K, V, R), Rez).