% candidat(L: list, E: element, Rest: list)
% Extrage un element din L si restul listei din dreapta elementului sau verifica daca E se afla in L.
% L: lista de elemente.
% E: element extras sau de verificat.
% Rest: lista din dreapta elementului.
% Model de flux: (i, o, o) - nedet., (i, i, o) - det., (i, i, i) - det.

candidat([H | T], H, T).
candidat([_ | T], E, Rest) :- candidat(T, E, Rest).

% valid(N: int, K: int, S: int)
% Verifica daca submultimea are cel putin N elemente si suma S divizibila cu 3.
% N: numarul de elemente ale unei submultimi.
% K: numarul de elemente ale submultimii candidat.
% S: suma submultimii candidat.
% Model de flux: (i, i, i) - det.

valid(N, K, S) :- K >= N, S mod 3 =:= 0.

% adaugaSfarsit(L: list, E: element, Rez: list)
% Adauga la sfarsitul listei L elementul E.
% L: lista la sfarsitul careia se va adauga elementul E.
% E: elementul de adaugat.
% Rez: L (+) E
% Model de flux: (i, i, o) - det.

adaugaSfarsit([], E, [E]).
adaugaSfarsit([H | T], E, [H | Rez]) :- adaugaSfarsit(T, E, Rez).

% submultimi(L: list, N: int, SubM: list, K: int, S: int, Rez: list)
% Determina o submultime a lui L cu minim N elemente si suma S divizibila cu 3.
% L: lista de intregi.
% N: numarul minim de elemente ale unei submultimi.
% SubM: submultimea curenta.
% K: numarul de elemente ale submultimii SubM.
% S: suma submultimii SubM.
% Rez: simbol unde se stocheaza submultimea rezultata.
% Model de flux: (i, i, i, i, i, o) - nedet., (i, i, i, i, i, i) - det.
submultimi(L, N, SubM, K, S, Rez) :-
  \+valid(N, K, S), % verificam validitatea solutiei la inceput pentru a cauta submultimi pentru solutiile invalide
  candidat(L, E, Rest),
  KT is K + 1,
  ST is S + E,
  adaugaSfarsit(SubM, E, SubMT),
  submultimi(Rest, N, SubMT, KT, ST, Rez).
submultimi(_, N, SubM, K, S, SubM) :- valid(N, K, S).

% submultimiWrap(L: list, N: int, Rez: list)
% Wrapper pentru predicatul 'submultimi'. Incepe cu o submultime cu un singur element.
% L: lista de intregi.
% N: numarul minim de elemente ale unei submultimi.
% Rez: submultimea rezultata.
% Model de flux: (i, i, o) - nedet., (i, i, i) - det.

submultimiWrap(L, N, Rez) :-
  candidat(L, E, Rest),
  submultimi(Rest, N, [E], 1, E, Rez).

% submultimiMain(L: list, N: int, Rez: list)
% Predicatul care colecteaza toate toate submultimile cu N minim elemente si suma div cu 3.
% L: lista de intregi
% N: numarul minim de elemente ale unei submultimi.
% Rez: simbol care colecteaza toate submultimile valide.
% Model de flux: (i, i, o), (i, i, i) - deterministe.

submultimiMain(L, N, Rez) :-
  findall(R, submultimiWrap(L, N, R), Rez).
