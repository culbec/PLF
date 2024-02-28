candidat([H | T], H, T).
candidat([_ | T], E, Rest) :- candidat(T, E, Rest).

numaraPare([], 0) :- !.
numaraPare([H | T], R) :-
    H mod 2 =:= 0,
    !,
    numaraPare(T, R1),
    R is R1 + 1.
numaraPare([_ | T], R) :- numaraPare(T, R).

adaugaSfarsit([], E, [E]) :- !.
adaugaSfarsit([H | T], E, [H | R]) :- adaugaSfarsit(T, E, R).

submultimiAux(_, S, SubM, S, SubM) :- numaraPare(SubM, N), N mod 2 =:= 0.
submultimiAux(L, S, SubM, SubMS, R) :-
    SubMS < S,
    candidat(L, E, Rest),
    SubMST is SubMS + E,
    adaugaSfarsit(SubM, E, SubMT),
    submultimiAux(Rest, S, SubMT, SubMST, R).

submultimiStart(L, S, R) :-
    candidat(L, E, Rest),
    submultimiAux(Rest, S, [E], E, R).

submultimi(L, S, Rez) :- findall(R, submultimiStart(L, S, R), Rez), write(Rez).