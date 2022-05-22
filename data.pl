% baza danych------------------------------------------------
name('Call Of Duty Black Ops').
name('Pluszwoy Miś Ben').
name('GTA 3').
name('Lizak o samku Coli').
name('HotWeels').

class('Call Of Duty Black Ops','gra').
class('Pluszwoy Miś Ben','pluszak').
class('GTA 3','gra').
class('Lizak o samku Coli','jedzenie').
class('HotWeels','samochodzik').

cost('Call Of Duty Black Ops',100).
cost('Pluszwoy Miś Ben',30).
cost('GTA 3',100).
cost('Lizak o samku Coli',3).
cost('HotWeels',4).

ageRestriction('Call Of Duty Black Ops',18).
ageRestriction('Pluszwoy Miś Ben',0).
ageRestriction('GTA 3',18).
ageRestriction('Lizak o samku Coli',3).
ageRestriction('HotWeels',3).

availability('Call Of Duty Black Ops',0).
availability('Pluszwoy Miś Ben',10).
availability('GTA 3',0).
availability('Lizak o samku Coli',0).
availability('HotWeels',1).

age('Call Of Duty Black Ops',10).
age('Pluszwoy Miś Ben',2).
age('GTA 3',15).
age('Lizak o samku Coli',0).
age('HotWeels',2).

popularity('Call Of Duty Black Ops',7).
popularity('Pluszwoy Miś Ben',10).
popularity('GTA 3',10).
popularity('Lizak o samku Coli',5).
popularity('HotWeels',5).

isDigital('Call Of Duty Black Ops',1).
isDigital('Pluszwoy Miś Ben',0).
isDigital('GTA 3',1).
isDigital('Lizak o samku Coli',0).
isDigital('HotWeels',0).

isCooperative('Call Of Duty Black Ops',1).
isCooperative('Pluszwoy Miś Ben',0).
isCooperative('GTA 3',0).
isCooperative('Lizak o samku Coli',0).
isCooperative('HotWeels',1).

isDangereous('Call Of Duty Black Ops',0).
isDangereous('Pluszwoy Miś Ben',0).
isDangereous('GTA 3',0).
isDangereous('Lizak o samku Coli',0).
isDangereous('HotWeels',0).

size('Call Of Duty Black Ops',0).
size('Pluszwoy Miś Ben',0).
size('GTA 3',0).
size('Lizak o samku Coli',0).
size('HotWeels',0).


%funkcje --------------------------------------------------------
sameIsDigital(I1,I2) :-
	isDigital(I1,X),
	isDigital(I2,Y),
	sdig(X,Y).
sdig(X,X).
sdig(X,Y):-
	nb_getval('ROZ',ROZ),
	add_tail(ROZ,'isDigital',ROZR),
	nb_setval('ROZ',ROZR).

sameIsCooperative(I1,I2) :-
	isCooperative(I1,X),
	isCooperative(I2,Y),
	scop(X,Y).
scop(X,X).
scop(X,Y):-
	nb_getval('ROZ',ROZ),
	add_tail(ROZ,'isCooperative',ROZR),
	nb_setval('ROZ',ROZR).

sameIsDangereous(I1,I2) :-
	isDangereous(I1,X),
	isDangereous(I2,Y),
	sden(X,Y).
sden(X,X).
sden(X,Y):-
	nb_getval('ROZ',ROZ),
	add_tail(ROZ,'isDangereous',ROZR),
	nb_setval('ROZ',ROZR).

sameSize(I1,I2) :-
	size(I1,X),
	size(I2,Y),
	ssize(X,Y).
ssize(X,X).
ssize(X,Y):-
	nb_getval('ROZ',ROZ),
	add_tail(ROZ,'size',ROZR),
	nb_setval('ROZ',ROZR).

samePopularity(I1,I2) :-
	popularity(I1,X),
	popularity(I2,Y),
	spop(X,Y).
spop(X,X).
spop(X,Y):-
	nb_getval('ROZ',ROZ),
	add_tail(ROZ,'popularity',ROZR),
	nb_setval('ROZ',ROZR).

sameClass(I1,I2) :-
	class(I1,X),
	class(I2,Y),
	scla(X,Y).
scla(X,X).
scla(X,Y):-
	nb_getval('ROZ',ROZ),
	add_tail(ROZ,'class',ROZR),
	nb_setval('ROZ',ROZR).

sameAgeRestriction(I1,I2) :-
	ageRestriction(I1,X),
	ageRestriction(I2,Y),
	sare(X,Y).
sare(X,X).
sare(X,Y):-
	nb_getval('ROZ',ROZ),
	add_tail(ROZ,'ageRestriction',ROZR),
	nb_setval('ROZ',ROZR).


sameAvailability(I1,I2) :-
	availability(I1,X),
	availability(I2,Y),
	saval(X,Y).
saval(X,X).
saval(X,Y):-
	nb_getval('ROZ',ROZ),
	add_tail(ROZ,'availability',ROZR),
	nb_setval('ROZ',ROZR).

	
sameAge(I1,I2) :-
	age(I1,X),
	age(I2,Y),
	sa(X,Y).
sa(X,X).
sa(X,Y):-
	nb_getval('ROZ',ROZ),
	add_tail(ROZ,'age',ROZR),
	nb_setval('ROZ',ROZR).

sameCost(I1,I2) :-
	cost(I1,X),
	cost(I2,Y),
	sp(X,Y).
sp(X,X).
sp(X,Y):-
	nb_getval('ROZ',ROZ),
	add_tail(ROZ,'cost',ROZR),
	nb_setval('ROZ',ROZR).
%-------------------------------------------------------
% add_tail(+List,+Element,-List)
% Add the given element to the end of the list, without using the "append" predicate.
add_tail([],X,[X]).
add_tail([H|T],X,[H|L]):-add_tail(T,X,L).

%twoży talicę rozrużnialności dla klasy gry
makeRozForClass(CLASS,I):-
	nb_setval('ROZ2',[]),
	iterForClass(CLASS,I).
iter2ForClass(_,[],_).
iter2ForClass(CLASS,[Head|Tail],I2):-
	class(Head,CLASS),
	iter2ForClass(CLASS,Tail,I2).
iter2ForClass(CLASS,[Head|Tail],I2):-
	not(class(Head,CLASS)),
	nb_setval('ROZ',[]),
	sameAge(I2,Head),
	sameAgeRestriction(I2,Head),
	sameAvailability(I2,Head),
	sameIsCooperative(I2,Head),
	sameIsDangereous(I2,Head),
	sameIsDigital(I2,Head),
	samePopularity(I2,Head),
	sameSize(I2,Head),
	sameCost(I2,Head),
	nb_getval('ROZ2',ROZ2),
	nb_getval('ROZ',ROZ),
	add_tail(ROZ2, ROZ ,ROZR),
	nb_setval('ROZ2',ROZR),
	iter2ForClass(CLASS,Tail,I2).

iter2ForClassR(_,[],_).
iter2ForClassR(CLASS,[Head|Tail],I2):-
	not(class(Head,CLASS)),
	iter2ForClass(CLASS,Tail,I2).
iter2ForClassR(CLASS,[Head|Tail],I2):-
	class(Head,CLASS),
	nb_setval('ROZ',[]),
	sameAge(I2,Head),
	sameAgeRestriction(I2,Head),
	sameAvailability(I2,Head),
	sameIsCooperative(I2,Head),
	sameIsDangereous(I2,Head),
	sameIsDigital(I2,Head),
	samePopularity(I2,Head),
	sameSize(I2,Head),
	sameCost(I2,Head),
	nb_getval('ROZ2',ROZ2),
	nb_getval('ROZ',ROZ),
	add_tail(ROZ2, ROZ ,ROZR),
	nb_setval('ROZ2',ROZR),
	iter2ForClassR(CLASS,Tail,I2).


iterForClass(_,[]).
iterForClass(CLASS,[Head|Tail]):-
	not(class(Head,CLASS)),
	iter2ForClassR(CLASS,Tail,Head),
	iterForClass(CLASS,Tail).
iterForClass(CLASS,[Head|Tail]):-
	class(Head,CLASS),
	iter2ForClass(CLASS,Tail,Head),
	iterForClass(CLASS,Tail).

%twoży talicę rozrużnialności każdego z każdym
makeRoz(I):-
	nb_setval('ROZ2',[]),
	iter(I).

iter2([],_).
iter2([Head|Tail],I2):-
	nb_setval('ROZ',[]),
	sameAge(I2,Head),
	sameAgeRestriction(I2,Head),
	sameAvailability(I2,Head),
	sameClass(I2,Head),
	sameIsCooperative(I2,Head),
	sameIsDangereous(I2,Head),
	sameIsDigital(I2,Head),
	samePopularity(I2,Head),
	sameSize(I2,Head),
	sameCost(I2,Head),
	nb_getval('ROZ2',ROZ2),
	nb_getval('ROZ',ROZ),
	add_tail(ROZ2, ROZ ,ROZR),
	nb_setval('ROZ2',ROZR),
	iter2(Tail,I2).

iter([]).
iter([Head|Tail]):-
	iter2(Tail,Head),
	iter(Tail).
%---------------------------------------------------------
%zlicza występwania X w znienej globalnej 'ROZ2'
countRoz2(X,RES):-
	R = 0,
	nb_getval('ROZ2',ROZ),
	itCount1(ROZ,X,R,RES).
itCount1([H|T],X,R,RES):-
	count(X,H,R,R1),
	itCount1(T,X,R1,RES).
	
itCount1([],_,R1,RES):-
	RES is R1.

count(_, [], I, R) :-
	R is I.
count(X, [X | T], I,R) :-
  !, count(X, T, I,R1),
  R is R1 + 1.
count(X, [_ | T], I,R) :-
  count(X, T, I,R).
  
  
%-----------------------------------------------------
%usuwa jeden element z listy
deletes(A,[B],[B]).
deletes(_,[],[]).
deletes(A, [A|B], B).
deletes(A, [B, C|D], [B|E]) :-
	deletes(A, [C|D], E).
	
%------------------------------------------------------------
% znajduje najczęściej występujący elemnet spośrud przekazanych jako OP w zmiennej globlanej 'ROZ2'
findMax(OP,R):-
	forEach(OP,R,_).
forEach([X|T],WNAME,WIL):-
	forEach(T,NAME2,IL2),
	countRoz2(X,RIL),
	bigger(NAME2,IL2,X,RIL, WNAME,WIL).
forEach([X],X,RIL):-
	countRoz2(X,RIL).
	
bigger(XN,XI,YN,YI,XN,XI):-
	XI >= YI.
bigger(XN,XI,YN,YI,YN,YI):-
	YI > XI.
	
%----------------------------

% sprawdza czy X należy do lsity przekazanej jako 2 parametr
memberOf(X, [X|_]).
memberOf(X, [_|Ys]) :-
    memberOf(X, Ys).

% usuwa wszystkie listy z listy list(2 parametr) które zwierają element przekazany jako 1 parametr 
deletesP(A,[B],[B]):-
	not(memberOf(A,B)).
deletesP(A,[B],[]):-
	memberOf(A,B).
deletesP(_,[],[]).
deletesP(A, [W|B], R):-
	memberOf(A,W),
	deletesP(A,B,R).
deletesP(A, [B, C|D], [B|E]) :-
	not(memberOf(A,B)),
	deletesP(A, [C|D], E).

deleteFromROZ2(X):-
	nb_getval('ROZ2',ROZ2),
	deletesP(X,ROZ2,RES),
	nb_setval('ROZ2',RES).
%-------------------------------------------------------------------
init():-
	nb_setval('REDUKT',[]),
	nb_setval('CECHY',['age','cost','isDigital','isCooperative','isDangereous','size','popularity','class','ageRestriction','availability']),
	nb_setval('PK',['Lizak o samku Coli','GTA 3','HotWeels','Pluszwoy Miś Ben','Call Of Duty Black Ops']).
	
makeRedukt():-
	init(),
	nb_getval('PK',PK),
	nb_getval('CECHY',OP),
	makeRoz(PK),
	pg(OP).
pg([]).
pg(OP):-
	findMax(OP,M),
	deleteFromROZ2(M),
	deletes(M,OP,ROP),
	saveInRedukt(M),
	nb_getval('ROZ2',ROZ),
	czyKon(ROP,ROZ).
czyKon(_,[]).	
czyKon(OP,ROZ):-
	pg(OP).

saveInRedukt(X):-
	nb_getval('REDUKT',ROZ),
	add_tail(ROZ,X,ROZR),
	nb_setval('REDUKT',ROZR).
%------------------------------------
initForClass():-
	nb_setval('REDUKT',[]),
	nb_setval('CECHY',['age','cost','isDigital','isCooperative','isDangereous','size','popularity','ageRestriction','availability']),
	nb_setval('PK',['Lizak o samku Coli','GTA 3','HotWeels','Pluszwoy Miś Ben','Call Of Duty Black Ops']).
	
%twoży redukt dla konkretnej klasy
makeReduktForClass(CLASS):-
	initForClass(),
	nb_getval('PK',PK),
	nb_getval('CECHY',OP),
	makeRozForClass(CLASS,PK),
	pg(OP).

print_variables([Head|Rest]) :-
	(
		Rest == [] -> format('~n',Head);
		format('~n, ',Head)
	),
	print_variables(Rest).

print_variables([]) :- 
	format('~n').