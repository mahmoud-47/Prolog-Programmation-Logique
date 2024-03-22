entree(salade,5). % La salade est une entrée coûtant 5€
entree(soupe,2).
plat(poulet,10).
dessert(glace,5).
dessert(fruit,2).


menu(E,P,D,C) :- entree(E, Pe),plat(P, Pp),dessert(D, Pd),
                C is Pe+Pd+Pp.