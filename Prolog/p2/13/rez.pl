% divizori(X: int, D: int, Div: list)
% X - numar intreg
% D - numar intreg, posibil divizor al lui X
% Div - lista de divizori ai lui X
% Model de flux: (i, i, o), (i, i, i)

divizori(X, D, []) :-
    D > X // 2.
divizori(X, D, [D | Rez]) :-
    X mod D =:= 0,
    !,
    DNew is D + 1,
    divizori(X, DNew, Rez).
divizori(X, D, Rez) :-
    DNew is D + 1,
    divizori(X, DNew, Rez),
    !.

% divizoriMain(X: int, Div: list)
% X - numar intreg
% Div - lista de divizori ai lui X
% Model de flux: (i, o), (i, i)

divizoriMain(X, []) :-
    X =< 1, !.
divizoriMain(X, Div) :-
    divizori(X, 2, Div),
    !.

% adaugaSfarsit(L: list, E: element, Rez: list)
% L - lista
% E - element de adaugat
% Rez - L (+) E
% Model de flux: (i, i, o), (i, i, i)

adaugaSfarsit([], E, [E]) :- !.
adaugaSfarsit([H | T], E, [H | Rez]) :-
    adaugaSfarsit(T, E, Rez),
    !.

% divizoriLista(L: lista, Col: list, Rez: list)
% L - lista
% Col - colectoare
% Rez - lista rezultat
% Model de flux: (i, i, o), (i, i, i)

divizoriLista([], Col, Col) :- !.
divizoriLista([H | T], Col, Rez) :-
    adaugaSfarsit(Col, H, ColNew),
    divizoriLista(T, ColNew, Rez),
    !.

% divizoriAll(L: list, Col: list, Rez: list)
% L - lista
% Col - colectoare
% Rez - lista rezultat
% Model de flux: (i, i, o), (i, i, i)

divizoriAll([], Col, Col) :- !.
divizoriAll([H | T], Col, Rez) :-
    divizoriMain(H, DivH),
    DivH \= [],
    !,
    adaugaSfarsit(Col, H, ColN),
    divizoriLista(DivH, ColN, ColNN),
    divizoriAll(T, ColNN, Rez).
divizoriAll([H | T], Col, Rez) :-
    adaugaSfarsit(Col, H, ColN),
    divizoriAll(T, ColN, Rez),
    !.

% divizoriEterogen(L: list, Rez: list)
% L - lista eterogena
% Rez - L in care pt fiecare sublista se adauga Lista de divizori ai
% fiecarui element
% Model de flux: (i, o), (i, i)

divizoriEterogen([], []).
divizoriEterogen([H | T], [H | Rez]) :-
    \+is_list(H),
    !,
    divizoriEterogen(T, Rez).
divizoriEterogen([H | T], [HNew | Rez]) :-
    divizoriAll(H, [], HNew),
    divizoriEterogen(T, Rez).



