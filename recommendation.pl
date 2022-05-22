:- module(recommendation, [recommend/2]).

:- use_module(reasoning).
:- use_module(variables).

recommend(Answers, FactorWithPodarekPairsResult) :-
    print_variables(Answers),
    findall(
        Factor-Podarek,
        calculate_podarek_recommendation_factor(Answers, Podarek, Factor),
        FactorWithPodarekPairs),
    print_variables(FactorWithPodarekPairs),
    keysort(FactorWithPodarekPairs, SortedFactorWithPodarekPairs),
    reverse(SortedFactorWithPodarekPairs, FactorWithPodarekPairsResult).

calculate_podarek_recommendation_factor([Cost, Res, Availability, Age, Popularity, Dangereous, Size], Podarek, Factor) :-
    get_cost_factor(Cost, Podarek, CostFactor),
    get_ageres_factor(Res, Podarek, ResFactor),
    get_age_factor(Age, Podarek, AgeFactor),
    get_size_factor(Size, Podarek, SizeFactor),
    get_availability_factor(Availability, Podarek, AvailabilityFactor),
    get_popularity_factor(Popularity, Podarek, PopularityFactor),
    get_dangereous_factor(Dangereous, Podarek, DangereousFactor),
    RecommandationFactors = [
        CostFactor,
        ResFactor,
        SizeFactor,
        AgeFactor,
        AvailabilityFactor,
        PopularityFactor,
        DangereousFactor
    ],
    sum_list_elements(RecommandationFactors, RecommandationFactorsSum),
    Factor is RecommandationFactorsSum / 7,
    true.

get_cost_factor(Cost, Podarek, Factor) :-
    map_cost_to_cost_factor(Cost, TargetFactor),
    cost_factor(Podarek, CostFactor),
    Factor is 1 - abs(TargetFactor - CostFactor).
	
get_ageres_factor(Res, Podarek, Factor) :-
    map_ageres_to_ageres_factor(Res, TargetFactor),
    ageres_factor(Podarek, ResFactor),
	(
		TargetFactor >= ResFactor -> Factor is 1;
		Factor is (1 - abs(TargetFactor - ResFactor))*(1 - abs(TargetFactor - ResFactor))
	).

get_availability_factor(Availability, Podarek, Factor) :-
    map_availability_to_availability_factor(Availability, TargetFactor),
    availability_factor(Podarek, AvailabilityFactor),
	(
		TargetFactor >= AvailabilityFactor -> Factor is 1;
		Factor is (1 - abs(TargetFactor - AvailabilityFactor))*(1 - abs(TargetFactor - AvailabilityFactor))
	).
	
get_age_factor(Age, Podarek, Factor) :-
    map_age_to_age_factor(Age, TargetFactor),
    age_factor(Podarek, AgeFactor),
    Factor is 1 - abs(TargetFactor - AgeFactor).
	
get_popularity_factor(Popularity, Podarek, Factor) :-
    map_popularity_to_popularity_factor(Popularity, TargetFactor),
    popularity_factor(Podarek, PopularityFactor),
    Factor is 1 - abs(TargetFactor - PopularityFactor).
	
get_dangereous_factor(Dangereous, Podarek, Factor) :-
    map_dangereous_to_dangereous_factor(Dangereous, TargetFactor),
    dangereous_factor(Podarek, DangereousFactor),
    Factor is 1 - abs(TargetFactor - DangereousFactor).
	
get_size_factor(Size, Podarek, Factor) :-
    map_size_to_size_factor(Size, TargetFactor),
    size_factor(Podarek, SizeFactor),
	(
		TargetFactor >= SizeFactor -> Factor is 1;
		Factor is (1 - abs(TargetFactor - SizeFactor))*(1 - abs(TargetFactor - SizeFactor))
	).
	
sum_list_elements([], 0).
sum_list_elements([ListHeader|ListTailElements], Sum) :-
    sum_list_elements(ListTailElements, TailElementsSum),
    Sum is ListHeader + TailElementsSum.
