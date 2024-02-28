genereazaMultime(I, N, []) :- I > N, !.
genereazaMultime(I, N, [I | R]) :- I1 is I + 1, genereazaMultime(I1, N, R).

candidat([H | _], H).
candidat([_ | T], E) :- candidat(T, E).

permutariAux(_, N, Perm, _, N, Perm) :- !.
permutariAux(L, N, Perm, Ultim, K, R) :-
    K < N,
    candidat(L, E),
    \+candidat(Perm, E),
    D is E - Ultim,
    abs(D) >= 2,
    KT is K + 1,
    permutariAux(L, N, [E | Perm], E, KT, R).

permutariStart(L, N, R) :-
    candidat(L, E),
    permutariAux(L, N, [E], E, 1, R).

permutari(N, Rez) :-
    genereazaMultime(1, N, L),
    findall(R, permutariStart(L, N, R), Rez),
    write(Rez).