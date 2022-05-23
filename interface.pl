:- module(interface, [read_answers/1, print_answers/1]).
:- use_module(variables).

read_answers([Cost, Res, Availability, Age, Popularity, Dangereous, Size, Digital, Cooperative]) :-
	read_cost(Cost),
	read_res(Res),
	read_age(Age),
	read_availability(Availability),
	read_popularity(Popularity),
	read_danger(Dangereous),
	read_size(Size),
	read_digital(Digital),
	read_cooperative(Cooperative).

read_digital(Digital) :- 
    format('~nCzy podarek ma byc wirtualny?~n'),
    tak_nie_list(Taknie_list),
	print_variables(Taknie_list),
	read(Digital).
	
read_cooperative(Cooperative) :- 
    format('~nCzy do użytkowania podarek ma wymagac innych ludzi?~n'),
    tak_nie_list(Taknie_list),
	print_variables(Taknie_list),
	read(Cooperative).
	
read_res(Res) :- 
    format('~nJaki jest wiek obdarowywanej osoby?~n'),
    ageres_list(Res_list),
	print_variables(Res_list),
	read(Res).

read_availability(Availability) :- 
    format('~nJak duzo czasu mamy by kupic podarek?~n'),
    availability_list(Availability_list),
	print_variables(Availability_list),
	read(Availability).

read_age(Age) :- 
    format('~nJak bardzo stary ma byc podarek?~n'),
    age_list(Age_list),
	print_variables(Age_list),
	read(Age).

read_danger(Danger) :- 
    format('~nJak bezpieczny ma byc podarek?~n'),
    dangereous_list(Dangereous_list),
	print_variables(Dangereous_list),
	read(Danger).

read_size(Size) :- 
    format('~nJakich rozmiarow ma byc podarek?~n'),
    size_list(Size_list),
	print_variables(Size_list),
	read(Size).

read_cost(Cost) :- 
    format('~nW jakim przedziale cenowym ma byc Podarek?~n'),
    cost_list(Costs_list),
	print_variables(Costs_list),
	read(Cost).

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

