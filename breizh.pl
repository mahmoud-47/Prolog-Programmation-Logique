/**************************************************************************/
/* FICHIER : breizh.pl */
/* AUTEUR : G. Koscielny et J.-Y. Antoine */
/* VERSION : 1.3. */
/* DATE : 15/12/2004 */
/* OBJET : genealogie royaume de Bretagne */
/**************************************************************************/

/********************************* FAITS **********************************/

/*------ Faits : definition des personnages royaux -----------------------*/

homme(conanIVlepetit).
homme(alainlenoir).
homme(henriIer).
homme(hoelIV).
homme(alainIVfergent).
homme(conanIIIlegros).
homme(mathiasII).
homme(hoelIII).
femme(mathilde).
femme(berthe).
femme(havoise).
femme(constance).

/*-------- Faits : definition des relations de parente directes ----------*/

/* pere_de(X,Y) vrai si le pere de X est Y */

pere_de(conanIVlepetit, alainlenoir).
pere_de(constance, alainlenoir).
pere_de(berthe, conanIIIlegros).
pere_de(hoelIV, conanIIIlegros).
pere_de(conanIIIlegros, alainIVfergent).
pere_de(alainIVfergent, hoelIII).
pere_de(mathiasII, hoelIII).

/* mere_de(X,Y) vrai si la mere de X est Y */

mere_de(conanIVlepetit, berthe).
mere_de(constance, berthe).
mere_de(hoelIV, mathilde).
mere_de(berthe, mathilde).
mere_de(alainIVfergent, havoise).
mere_de(mathiasII, havoise).

/***************** REGLES : relations de parente indirectes **************/

/* parent_de(X,Y) vrai si Y est un des parents de X */

parent_de(Fils, P) :- pere_de(Fils, P).
parent_de(Fils, P) :- mere_de(Fils, P).

/* fils_de(P,F) vrai si F est un fils de P */

fils_de(P, Fils) :- parent_de(Fils, P), homme(Fils).




fille(X,Y) :- femme(X), (pere_de(Y, X);mere_de(Y, X)).

frere_de(X,Y) :- homme(X), 
    parent_de(Z,X), 
    parent_de(Z,Y),
    X \= Y.

gdparent(X,Y) :- parent_de(X, Z), parent_de(Z, Y).