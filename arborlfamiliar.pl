

% Hechos
esMadreDe(sara, jorge).
esMadreDe(sara, gonzalo).
esMadreDe(sara, lucia).
esMadreDe(lucia, jose).
esMadreDe(lucha, martin).
esMadreDe(daniela, ana).
esMadreDe(daniela, miguel).
esMadreDe(carmen, dora).
esMadreDe(carmen, enrique).
esPadreDe(manuel, gonzalo).
esPadreDe(manuel, lucia).
esPadreDe(manuel, fernando).
esPadreDe(jorge, martin).
esPadreDe(jorge, francisco).
esPadreDe(gonzalo, ana).
esPadreDe(gonzalo, miguel).
esPadreDe(fernando, dora).
esPadreDe(fernando, enrique).
 
% Reglas
esAbuelaDe(A,B) :-
 esMadreDe(A, N),
 esMadreDe(N, B).
esAbuelaDe(A,B) :-
 esPadreDe(A, N),
 esPadreDe(N, B).
esAbuelaDe(A,B) :-
 esPadreDe(A, N),
 esMadreDe(N, B).
esAbuelaDe(A,B) :-
 esMadreDe(A, N),
 esPadreDe(N, B).
esNietoDe(A, B) :-
 esAbuelaDe(B, A).
esHermanoDe(A, B) :-
 esMadreDe(N, A),
 esMadreDe(N, B),
 not(A=B).
esHermanoDe(A, B) :-
 esPadreDe(N, A),
 esPadreDe(N, B),
 not(A=B).
esSobrinoDe(A, B) :-
 esHermanoDe(N, A),
 esMadreDe(N, B).
esSobrinoDe(A, B) :-
 esHermanoDe(N, A),
 esPadreDe(N, B).
esTioDe(A, B) :-
 esSobrinoDe(B, A).
esPrimoDe(A, B) :-
 esTioDe(A, N),
 esMadreDe(N, B),
 not(A=B).
esPrimoDe(A, B) :-
 esTioDe(A, N),
 esPadreDe(N, B),
 not(A=B).