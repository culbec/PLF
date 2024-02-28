aux(H, Max, Rez) :- H > 0, H > Max, !, Rez = H.
aux(_,  Max, Max).

%f([], -1).
%f([H | T], Rez) :- f(T, S1), aux(H, S1, Rez).

f([], -1).
f([H | T], S) :- f(T, S1), H > 0, H > S1, !, S is H, !.
f(_, _).
