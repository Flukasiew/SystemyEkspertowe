:- module(variables, 
	[
        cost_list/1, popularity_list/1,print_variables/1, map_cost_to_cost_factor/2, map_popularity_to_popularity_factor/2,
		ageres_list/1, map_ageres_to_ageres_factor/2,
		availability_list/1, map_availability_to_availability_factor/2,
		age_list/1, map_age_to_age_factor/2,
		dangereous_list/1, map_dangereous_to_dangereous_factor/2,
		size_list/1, map_size_to_size_factor/2,
		tak_nie_list/1, map_taknie_to_taknie_factor/2
	]).

cost_list([cheap, medium, expensive]).
ageres_list([veryyoung, young, child, teen, adult]).
availability_list([short, mediumlong, long]).
age_list([new, mediumold, old]).
popularity_list([unpopular, mediumpopular, popular]).
dangereous_list([safe, mediumdanger, dangereous]).
size_list([small, mediumbig, big]).
tak_nie_list([tak, nie]).

map_cost_to_cost_factor(Cost, Factor) :-
	(
		Cost == cheap -> Factor is 0;
		Cost == medium -> Factor is 0.5;
		Cost == expensive -> Factor is 1
	).
	
map_ageres_to_ageres_factor(Res, Factor) :-
	(
		Res == veryyoung -> Factor is 0;
		Res == young -> Factor is 0.25;
		Res == child -> Factor is 0.5;
		Res == teen -> Factor is 0.75;
		Res == adult -> Factor is 1
	).
	
map_availability_to_availability_factor(Availability, Factor) :-
	(
		Availability == short -> Factor is 0;
		Availability == mediumlong -> Factor is 0.5;
		Availability == long -> Factor is 1
	).
	
map_age_to_age_factor(Age, Factor) :-
	(
		Age == new -> Factor is 0;
		Age == mediumold -> Factor is 0.5;
		Age == old -> Factor is 1
	).
	
map_popularity_to_popularity_factor(Popularity, Factor) :-
	(
		Popularity == unpopular -> Factor is 0;
		Popularity == mediumpopular -> Factor is 0.5;
		Popularity == popular -> Factor is 1
	).
	
map_dangereous_to_dangereous_factor(Dangereous, Factor) :-
	(
		Dangereous == safe -> Factor is 0;
		Dangereous == mediumdanger -> Factor is 0.5;
		Dangereous == dangereous -> Factor is 1
	).

map_size_to_size_factor(Size, Factor) :-
	(
		Size == small -> Factor is 0;
		Size == mediumbig -> Factor is 0.5;
		Size == big -> Factor is 1
	).
	
map_taknie_to_taknie_factor(Value, Factor) :-
	(
		Value == nie -> Factor is 0;
		Value == tak -> Factor is 1
	).
	
print_variables([]) :- 
	format('~n').

print_variables([Head|Rest]) :-
	(
		Rest == [] -> format('~w',Head);
		format('~w, ',Head)
	),
	print_variables(Rest).