p(1).
p(2).
p(3).
q :- p(I), I >= 2, write(I), nl, false.

candidat([H | T], H, T).
candidat([_ | T], E, Rest) :- candidat(T, E, Rest).

genereazaInterval(A, B, []) :- A > B, !.
genereazaInterval(A, B, [A | R]) :- A1 is A + 1, genereazaInterval(A1, B, R).

adaugaSfarsit([], E, [E]) :- !.
adaugaSfarsit([H | T], E, [H | R]) :- adaugaSfarsit(T, E, R).

submultimiAux(_, SubM, S, SubM) :- S mod 2 =:= 1.
submultimiAux(L, SubM, S, R) :-
    candidat(L, E, Rest),
    ST is S + E,
    adaugaSfarsit(SubM, E, SubMT),
    submultimiAux(Rest, SubMT, ST, R).

submultimiStart(L, R) :-
    candidat(L, E, Rest),
    submultimiAux(Rest, [E], E, R).

submultimi(A, B, Rez) :-
    genereazaInterval(A, B, L),
    findall(R, submultimiStart(L, R), Rez).