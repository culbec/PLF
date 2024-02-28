candidat([H | T], H, T).
candidat([_ | T], E, Rest) :- candidat(T, E, Rest).

genereazaInterval(A, B, []) :- A > B, !.
genereazaInterval(A, B, [A | R]) :- A1 is A + 1, genereazaInterval(A1, B, R).

numaraPare([], 0) :- !.
numaraPare([H | T], N) :- H mod 2 =:= 0, !, numaraPare(T, N1), N is N1 + 1.
numaraPare([_ | T], N) :- numaraPare(T, N).

numaraImpare([], 0) :- !.
numaraImpare([H | T], N) :- H mod 2 =:= 1, !, numaraImpare(T, N1), N is N1 + 1.
numaraImpare([_ | T], N) :- numaraImpare(T, N).

adaugaSfarsit([], E, [E]) :- !.
adaugaSfarsit([H | T], E, [H | R]) :- adaugaSfarsit(T, E, R).

submultimiAux(_, SubM, SubM) :- numaraPare(SubM, NrPare), numaraImpare(SubM, NrImpare), NrPare mod 2 =:= 0, NrImpare mod 2 =:= 1.
submultimiAux(L, SubM, R) :-
    candidat(L, E, Rest),
    adaugaSfarsit(SubM, E, SubMT),
    submultimiAux(Rest, SubMT, R).

submultimiStart(L, R) :-
    candidat(L, E, Rest),
    submultimiAux(Rest, [E], R).

submultimi(A, B, Rez) :-
    genereazaInterval(A, B, L),
    findall(R, submultimiStart(L, R), Rez).

