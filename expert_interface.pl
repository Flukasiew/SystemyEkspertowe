:- module(expert_interface, [expert_menu/0]).

:- use_module(variables).
:- use_module(database_service).
:- use_module(reasoning).

expert_menu :-
	format('~nCo chcesz zrobić?~n~n'),
	print_variables([wstaw, zmien, usun]),
	read(Opt),
	(
		Opt == wstaw -> insert_interface;
	    Opt == zmien -> update_interface;
	    Opt == usun -> delete_interface
	).
	
update_interface :-
    format('~nZmieniasz istniejący podarek.~n'),
    read_name(Podarek),
	read_answers(Answers),
	format('~nNa pewno chcesz zmienić ten podarek?~n'),
	confirm,
    update_podarek(Podarek, Answers),
    format('~nPodarek został zmieniony.~n').

insert_interface :-
    format('~nDodajesz nowy podarek.~n'),
    read_name(Podarek),
	read_answers(Answers),
	format('~nNa pewno chcesz dodać ten podarek?~n'),
	confirm,
    insert_podarek(Podarek, Answers),
    format('~nPodarek został dodany.~n').

delete_interface :-
    format('~nUsuwasz podarek.~n'),
    read_name(Podarek),
	format('~nNa pewno chcesz usunąć podarek?~n'),
	confirm,
	delete_podarek(Podarek),
	format('~nPodarek został usunięty.~n').
	
confirm :-
    read_boolean(Opt),
	(
		Opt == tak -> true;
	    format('~nPrzerwano operację.~n'), false
	).
	
read_answers([
    VClass, Cost, AgeRestriction, Availability, Age, Popularity, IsDigital, IsCooperative, Dangereous, Size
]) :- 
    read_class(VClass), 
    read_cost(Cost),
    read_ageres(AgeRestriction),
    read_availability(Availability), 
    read_age(Age),
    read_popularity(Popularity),
    read_digital(IsDigital),
    read_cooperative(IsCooperative), 
    read_dangereous(Dangereous), 
    read_size(Size).
	
read_name(Name) :-
    format('~nPodaj nazwę podarka?~n'),
	read(Name).

read_class(VClass) :- 
	format('~nDo jakiej klasy należy podarek?~n'),
	read(VClass).
	
read_cost(Cost) :-
	format('~nIle kosztuje podarek?~n'),
	read(Cost).

read_ageres(AgeRestriction) :-
	format('~nJakie jest ograniczenie wiekowe podarka?~n'),
	read(AgeRestriction).
	
read_availability(Availability) :- 
	format('~nJaka jest dostępność czasowa podarka w dniach?~n'),
	read(Availability).

read_age(Age) :- 
	format('~nIle lat ma podarek?~n'),
	read(Age).
	
read_popularity(Popularity) :-
	format('~nJak popularny jest podarek (średnia ocena użytkoników z zakresu [0,10])?~n'),
	read(Popularity).
	
read_digital(IsDigital) :-
	format('~nCzy podarek jest cyfrowy (0 - nie, 1 - tak)?~n'),
	read(IsDigital).
	
read_cooperative(IsCooperative) :-
	format('~nCzy podarek wymaga innych ludzi do użytkowania (0 - nie, 1 - tak)?~n'),
	read(IsCooperative).

read_dangereous(Dangereous) :-
	format('~nJak bardzo podarek jest niebezpieczny (liczba z zakresu [0,1])?~n'),
	read(Dangereous).

read_size(Size) :-
	format('~nJak wielki jest podarek (w m^3)?~n'),
	read(Size).
	
read_boolean(Result) :-
    tak_nie_list(YesNo),
	print_variables(YesNo),
	read(Result).
