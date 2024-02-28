% fibonacci(I1: int, I2: int, N: int, Rez: list)
% I1 - primul termen din formula de recurenta
% I2 - al doilea termen din formula de recurenta
% N - numarul de numere fibonacci care mai sunt de generat excluzand
% primii 2 termeni
% Rez - lista care contine sirul fibonacci excluzand
% primii 2 termeni
% Model de flux: (i, i, i, o), (i, i, i, i)

fibonacci(_, _, 0, []) :- !.
fibonacci(I1, I2, N, [I3 | Rez]) :-
    I3 is I1 + I2,
    NNew is N - 1,
    fibonacci(I2, I3, NNew, Rez).

% fibonacciMain(N: int)
% N - numarul de numere din sirul Fibonacci de generat
% Model de flux: (i)

fibonacciMain(N) :-
    N < 3,
    write("N trebuie sa fie >= 3."), nl, !.
fibonacciMain(N) :-
    NNew is N - 2,
    fibonacci(0, 1, NNew, Rez),
    RezNew = [0, 1 | Rez],
    write("Sirul: "), write(RezNew), nl, !.

