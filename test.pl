inv([], []).
inv([A|B], X) :- inv(B, T), append(T, [A], X).

fact(0, 1).
fact(N, X) :- M is N-1, fact(M, Y), X is N*Y.

somme([], 0).
somme([A|B], S) :- somme(B, X), S is A+X.

recherche(A, [A|_]).
recherche(A, [_|B]) :- recherche(A, B).

pal(L) :- inv(L,InvL),L==InvL.

long([], 0).
long([_|B], L) :- long(B, X), L is X+1.