aux(H, E, Rez) :- H < E, Rez is H + E.
aux(_, E, Rez) :- Rez is E + 2.

f([], 0).
f([H | T], S) :- f(T, S1), aux(H, S1, S), !.
