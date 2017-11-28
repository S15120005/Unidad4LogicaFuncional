entrada(antipasto).
entrada(sopa).
entrada(queso).

carne(milanesa).
carne(bief_de_chorizo).
carne(pollo_asado).

pescado(congrio).
pescado(pejerey).

postre(flan).
postre(helado).
postre(fruta).

plato_principal(P):-carne(P);pescado(P).

comida(E,P,D):-entrada(E),plato_principal(P),postre(D).

calorias(antipasto,100).
calorias(sopa,50).
calorias(queso,180).
calorias(milanesa,300).
calorias(bief_de_chorizo,400).
calorias(pollo_asado,150).
calorias(congrio,200).
calorias(pejerey,210).
calorias(flan,100).
calorias(helado,450).
calorias(fruta,100).

valor(E,P,D,V):-calorias(E,X),calorias(P,Y),calorias(D,Z),V=X+Y+Z.

comida_equilibrada(E,P,D):-comida(E,P,D), valor(E,P,D,Z),Z<=800