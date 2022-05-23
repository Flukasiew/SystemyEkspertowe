:- module(database_service, [update_podarek/2, insert_podarek/2, delete_podarek/1]).
:- use_module(db).

update_podarek(Podarek, Attributes) :-
    delete_podarek(Podarek),
    insert_podarek(Podarek, Attributes),
	commit.


insert_podarek(
    Podarek,
    [
        Class, Cost, AgeRestriction, Availability, Age, Popularity, IsDigital, IsCooperative, Dangereous, Size
    ]) :-

    assertz(db:class(Podarek,Class)),
    assertz(db:cost(Podarek,Cost)),
    assertz(db:ageRestriction(Podarek,AgeRestriction)),
    assertz(db:availability(Podarek,Availability)),
    assertz(db:age(Podarek,Age)),
    assertz(db:popularity(Podarek,Popularity)),
	assertz(db:isDigital(Podarek,IsDigital)),
    assertz(db:isCooperative(Podarek,IsCooperative)),
	assertz(db:dangereous(Podarek,Dangereous)),
	assertz(db:size(Podarek,Size)),
	commit.

delete_podarek(Podarek) :-
    retractall(db:class(Podarek,_)),
    retractall(db:cost(Podarek,_)),
    retractall(db:ageRestriction(Podarek,_)),
    retractall(db:availability(Podarek,_)),
    retractall(db:age(Podarek,_)),
    retractall(db:popularity(Podarek,_)),
	retractall(db:isDigital(Podarek,_)),
    retractall(db:isCooperative(Podarek,_)),
	retractall(db:dangereous(Podarek,_)),
	retractall(db:size(Podarek,_)),
	commit.


commit :- 
    tell('db_podarki.pl'),
    listing(db:class),
    listing(db:cost),
    listing(db:ageRestriction),
    listing(db:availability),
    listing(db:age),
    listing(db:popularity),
	listing(db:isDigital),
    listing(db:isCooperative),
	listing(db:dangereous),
	listing(db:size),
    told.