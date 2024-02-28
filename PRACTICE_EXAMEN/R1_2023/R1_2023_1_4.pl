g([], 0).
g([H | T], S) :- g(T, S1), S1 is S - H.
