:- module(variables, 
	[
        class_list/1, wealth_list/1, popularity_list/1,print_variables/1, map_wealth_to_factor/2, map_popularity_to_factor/2
	]).


class_list(['gra','pluszak','jedzenie','samochodzik']).
wealth_list([tani,sredni,drogi]).
popularity_list([malo, troche, bardzo]).

map_wealth_to_factor(Wealth, Factor) :-
	(
		Wealth == tani -> Factor is 0;
		Wealth == sredni -> Factor is 0.5;
		Wealth == drogi -> Factor is 1
	).

map_popularity_to_factor(Popularity, Factor) :-(
		Popularity == malo -> Factor is 0;
		Popularity == troche -> Factor is 0.5;
		Popularity == bardzo -> Factor is 1
).

print_variables([]) :- 
	format('~n').

print_variables([Head|Rest]) :-
	(
		Rest == [] -> format('~w',Head);
		format('~w, ',Head)
	),
	print_variables(Rest).