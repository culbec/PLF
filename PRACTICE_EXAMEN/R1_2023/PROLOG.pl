% aux(H: integer, S: integer, R: integer)
% Determina maximul dintre H si S, daca H > 0, altfel returneaza S.
% H: elementul de comparat.
% S: elementul maxim pozitiv curent sau -1 daca nu exista element pozitiv pana la comparatie.
% R: rezultatul.
% Model de flux: (i, i, o) - determinist.

aux(H, S, H) :- H > 0, S < H, !.
aux(_, S, S).

f([], -1).
f([H | T], S) :- f(T, S1), aux(H, S1, S).

g([], 0).
g([H | T], S) :- g(T, S1), S1 is S - H.

% candidat(L: list, E: element)
% Extrage un element din L sau verifica daca E se afla in L.
% L: lista de elemente.
% E: Element extras sau de verificat existenta.
% Model de flux: (i, o) - nedet., (i, i) - det.

candidat([H | _], H).
candidat([_ | T], E) :- candidat(T, E).

% valid(K: int, P: int, KA: int, PA: int)
% Verifica daca parametrii un aranjament partial este valid.
% K: size aranjament.
% P: produs aranjament.
% KA: size aranjament partial.
% PA: produs aranjament partial.
% Model de flux: (i, i, i, i) - det.

valid(K, P, KA, PA) :- KA =< K, PA =< P. 

% aranjamente(L: list, K: int, P: int, A: list, KA: int, PA: int, Rez: list)
% Aranjamente de K element cu produs P.
% L: lista de intregi.
% K: marimea unui aranjament.
% P: produsul unui aranjament.
% A: aranjament partial.
% KA: numarul de elemente ale aranjamentului partial.
% PA: produsul aranjamentului partial.
% Rez: aranjament partial valid.
% Model de flux: (i, i, i, i, i, i, o) - nedet., (i, i, i, i, i, i, i) - det.

aranjamente(L, K, P, A, KA, PA, Rez) :-
  candidat(L, E), % alege un nou element de testat
  \+candidat(A, E), % verifica ca elementul sa nu fie in aranjamentul partial
  KT is KA + 1, % testam cu noi parametrii modificati
  PT is PA * E,
  valid(K, P, KT, PT), % verificam daca aranjamentul partial nou ar fi valid
  aranjamente(L, K, P, [E | A], KT, PT, Rez). % rulam recursivitatea
aranjamente(_, K, P, A, KA, PA, A) :- K =:= KA, P =:= PA.

% aranjamenteWrap(L: list, K: int, P: int, Rez: list)
% Wrapper pentru predicatul 'aranjamente'.
% L: lista de intregi.
% K: marimea unui aranjament.
% P: produsul unui aranjament.
% Rez: aranjament valid.
% Model de flux: (i, i, i, o) - nedet., (i, i, i, i) - det.

aranjamenteWrap(L, K, P, Rez) :-
  candidat(L, E),
  aranjamente(L, K, P, [E], 1, E, Rez).

% aranjamenteMain(L: list, K: int, P: int, Rez: list)
% Functia main care colecteaza toate aranjamentele de marime K si produs P.
% L: lista de intregi.
% K: numarul de elemente ale unui aranjament.
% P: produsul unui aranjament.
% Rez: lista rezultat care contine toate aranjamentele.
% Model de flux: (i, i, i, o) - det., (i, i, i, i) - det.

aranjamenteMain(L, K, P, Rez) :-
  findall(R, aranjamenteWrap(L, K, P, R), Rez).
