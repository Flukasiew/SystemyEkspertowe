:- module(interface, [read_answers/1, print_answers/1]).
:- use_module(variables).

read_answers([Price, Popularity]) :-
	read_wealth(Price),
	read_popularity(Popularity).

read_wealth(Price) :- 
    format('~nW jakim przedziale cenowym ma byc Podarek?~n'),
    wealth_list(Prices_list),
	print_variables(Prices_list),
	read(Price).

read_popularity(Popularity) :- 
	format('~nJak popularny ma byc podarek?~n'),
	popularity_list(Popularity_list),
	print_variables(Popularity_list),
	read(Popularity).

print_answers([]) :- 
	format('~n').

print_answers([Head|Rest]) :-
	(
		Rest == [] -> format('~w',Head);
		format('~w, ',Head)
	),
    print_variables(Rest).

