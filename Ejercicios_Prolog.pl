/*Ejercicio 1: Brujas*/
witch(X):-burns(X),female(X).
burns(X) :- wooden(X).
wooden(X) :- floats(X).
floats(X) :- sameweight(duck, X).

female(girl).
sameweight(duck,girl).

/*  Ejercicio 2: Cancion Estupida */
cancionestupida(0):-nl,write('Gomo ya no gueda shev vezza, -hic- be boy a doddmig...').
cancionestupida(N):-N>1,nl,write(' botellas de cerveza en el suelo'),nl,
                    write(N),write(' botellas de cerveza'),nl,
                    write('La gojo y be la bhebo'),nl,
                    A is N-1, cancionestupida(A).

/*  Diagnostico  de enfermedades */ 
enfermo_de(manuel, gripe).
tiene_sintoma(alicia, cansancio).
sintoma_de(fiebre, gripe).
sintoma_de(tos, gripe).
sintoma_de(cansancio, anemia).
elimina(vitaminas, cansancio).
elimina(aspirinas, fiebre).
elimina(jarabe, tos).
recetar_a(X,Y):-enfermo_de(Y,A),alivia(X,A).
alivia(X,Y):-elimina(X,A),sintoma_de(A,Y).

enfermo_de(X,Y):-tiene_sintoma(X,Z),sintoma_de(Z,Y).

/*  Planificador de gastos  */
transporte(roma,20000).
transporte(londres,25000).
transporte(tunez,15000).

alojamiento(hotel,roma,25000). 
alojamiento(hotel,londres,15000). 
alojamiento(hotel,tunez,10000). 
alojamiento(hostal,roma,15000). 
alojamiento(hostal,londres,10000). 
alojamiento(hostal,tunez,8000). 
alojamiento(camping,roma,10000). 
alojamiento(camping,londres,5000). 
alojamiento(camping,tunez,5000).



viaje(W,X,Y,Z):-transporte(W,A),alojamiento(Y,W,C),B is C*X,Z is A+B.

% viaje(W,Y,Z):-transporte(W,A),alojamiento(Y,W,C),B is C+A,Z>=B.



/*  Arbol genealogico  */
padre(enrique7,enrique8).
padre(enrique7,arturo).
padre(enrique7,margarita).
padre(enrique8,catalina).
padre(enrique8,ana).
padre(enrique8,juana).

madre(catalina,maria).
madre(ana,isabel).
madre(juana,eduardo).

progenitor(X,Y):-padre(X,Y);madre(X,Y).

hombre(enrique7).
hombre(enrique8).
hombre(arturo).
hombre(eduardo).

mujer(margarita).
mujer(catalina).
mujer(maria).
mujer(ana).
mujer(isabel).
mujer(juana).

hermano(X,Y):-hombre(X),
            progenitor(A,X),progenitor(B,Y),
            A=B.

hermana(X,Y):-mujer(X),
            progenitor(A,X),progenitor(B,Y),
            A=B.

abuelo(X,Y):-hombre(X),progenitor(A,Y),progenitor(X,A).
abuela(X,Y):-mujer(X),progenitor(A,Y),progenitor(X,A).

/*  Horoscopo */
/* horoscopo(Signo,DiaIni,MesIni,DiaFin,MesFin)
<- son del signo Signo los nacidos entre el DiaIni/MesIni y el DiaFin/MesFin */
horoscopo(aries,21,3,21,4).
horoscopo(tauro,21,4,21,5).
horoscopo(geminis,21,5,21,6).
horoscopo(cancer,21,6,21,7).
horoscopo(leo,21,7,21,8).
horoscopo(virgo,21,8,21,9).
horoscopo(libra,21,9,21,10).
horoscopo(escorpio,21,10,21,11).
horoscopo(sagitario,21,11,21,12).
horoscopo(capricornio,21,12,21,1).
horoscopo(acuario,21,1,21,2).
horoscopo(piscis,21,2,21,3).


/* mes(Mes,Dias,Nombre) <- el mes Nombre, de número Mes tiene Dias */
mes(1,31,enero).
mes(2,28,febrero).
mes(3,31,marzo).
mes(4,30,abril).
mes(5,31,mayo).
mes(6,30,junio).
mes(7,31,julio).
mes(8,31,agosto).
mes(9,30,septiembre).
mes(10,31,octubre).
mes(11,30,noviembre).
mes(12,31,diciembre).
/* signo(Dia, Mes, Signo)*/
signo(Dia,Mes,Signo) :- horoscopo(Signo,D1,M1,D2,M2),
( (Mes=M1,Dia>=D1,mes(M1,D,_),Dia=<D) ;
(Mes=M2,Dia=<D2, Dia>0) ).

/* sumatorio(Num,Sum) <- Sum es el sumatorio desde 1 hasta Num */
sumatorio(1,1) :- !.
sumatorio(N,S) :- N1 is N-1,
sumatorio(N1,S1),
S is N+S1.
/* natural(Num) <- Num es un número perteneciente a los Naturales */
natural(0).
natural(X) :- natural(Y),
X is Y+1.
/* diventera(Dividendo,Divisor,Cociente) <- Cociente es el resultado de la división */
diventera(A,B,C) :- natural(C),
Y1 is C*B,
Y2 is (C+1)*B,
Y1=<A, Y2>A, !.


