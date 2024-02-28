interval(B, B, [B]) :- !.
interval(A, B, [A | R]) :-
  A1 is A + 1,
  interval(A1, B, R).

buildInterval(N, R) :- A is N, B is 2 * N - 1, interval(A, B, R).

interval1(N, Current, []) :- Current =:= 2 * N, !.
interval1(N, Current, [Current | R]) :-
  Next is Current + 1,
  interval1(N, Next, R).
