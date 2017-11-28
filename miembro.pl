/* miembro(Elem,Lista,Pos) <- el término Elem pertenece a la lista Lista y ocupa la posición Pos*/ 
miembro(X,[X|_],1). 
miembro(X,[_|Y],N) :- miembro(X,Y,N1), 
                      N is N1+1. 

/* borrarN(Pos,L1,L2) <- se borra el elemento Elem que ocupa la posición Pos de la lista L1 obteniendose la lista L2 */ 
borrarN(1,[_|Y],Y). 
borrarN(N,[Z|L],[Z|M]) :- N1 is N-1, 
                          borrarN(N1,L,M).