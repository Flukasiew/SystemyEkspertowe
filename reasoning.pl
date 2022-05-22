:- module(reasoning,
    [
        cost_factor/2,
        popularity_factor/2,
        ageres_factor/2,
        availability_factor/2,
        age_factor/2,
        dangereous_factor/2,
        size_factor/2,
        map_taknie_to_taknie_factor/2
    ]).

:- use_module(variables).
:- use_module(db).

cost_factor(Podarek, Factor) :-
    cost_cheap_range(Podarek, CheapFactor),
    cost_medium_range(Podarek, MediumFactor),
    cost_expensive_range(Podarek, ExpensiveFactor),
    map_cost_to_cost_factor(cheap, CheapMappedFactor),
    map_cost_to_cost_factor(medium, MediumMappedFactor),
    map_cost_to_cost_factor(expensive, ExpensiveMappedFactor),
    sharpen(
        [CheapFactor, MediumFactor, ExpensiveFactor],
        [CheapMappedFactor, MediumMappedFactor, ExpensiveMappedFactor],
        Factor
    ).
	
cost_cheap_range(Podarek, Factor) :-
    db:cost(Podarek, Cost),
    (
        Cost < 20 -> Factor is 1;
        Cost >= 20, Cost < 50 -> triangle_down(20, 50, Cost, Factor);
        Factor is 0
    ).

cost_medium_range(Podarek, Factor) :-
    db:cost(Podarek, Cost),
    (
        Cost >= 20, Cost < 30 -> triangle_up(20, 30, Cost, Factor);
        Cost >= 30, Cost < 60 -> Factor is 1;
        Cost >= 60, Cost < 100 -> triangle_down(60, 100, Cost, Factor);
        Factor is 0
    ).

cost_expensive_range(Podarek, Factor) :- 
    db:cost(Podarek, Cost),
    (
        Cost >= 60, Cost < 80 -> triangle_up(60, 80, Cost, Factor);
        Cost >= 80 -> Factor is 1;
        Factor is 0
    ).

ageres_factor(Podarek, Factor) :-
    ageres_veryyoung_range(Podarek, VeryYoungFactor),
    ageres_young_range(Podarek, YoungFactor),
    ageres_child_range(Podarek, ChildFactor),
	ageres_teenager_range(Podarek, TeenFactor),
	ageres_adult_range(Podarek, AdultFactor),
    map_ageres_to_ageres_factor(veryyoung, VeryYoungMappedFactor),
    map_ageres_to_ageres_factor(young, YoungMappedFactor),
    map_ageres_to_ageres_factor(child, ChildMappedFactor),
	map_ageres_to_ageres_factor(teen, TeenMappedFactor),
	map_ageres_to_ageres_factor(adult, AdultMappedFactor),
    sharpen(
        [VeryYoungFactor, YoungFactor, ChildFactor, TeenFactor, AdultFactor],
        [VeryYoungMappedFactor, YoungMappedFactor, ChildMappedFactor, TeenMappedFactor, AdultMappedFactor],
        Factor
    ).
	
ageres_veryyoung_range(Podarek, Factor) :-
    db:ageRestriction(Podarek, Res),
    (
        Res < 3 -> Factor is 1;
        Res >= 3, Res < 7 -> triangle_down(3, 7, Res, Factor);
        Factor is 0
    ).
	
ageres_young_range(Podarek, Factor) :-
    db:ageRestriction(Podarek, Res),
    (
        Res >= 3, Res < 7 -> triangle_up(3, 7, Res, Factor);
		Res >=7, Res < 12 -> triangle_down(7, 12, Res, Factor);
        Factor is 0
    ).
	
ageres_child_range(Podarek, Factor) :-
    db:ageRestriction(Podarek, Res),
    (
        Res >= 7, Res < 12 -> triangle_up(7, 12, Res, Factor);
		Res >=12, Res < 16 -> triangle_down(12, 16, Res, Factor);
        Factor is 0
    ).
	
ageres_teenager_range(Podarek, Factor) :-
    db:ageRestriction(Podarek, Res),
    (
        Res >= 12, Res < 16 -> triangle_up(12, 16, Res, Factor);
		Res >=16, Res < 18 -> triangle_down(16, 18, Res, Factor);
        Factor is 0
    ).

ageres_adult_range(Podarek, Factor) :-
    db:ageRestriction(Podarek, Res),
    (
        Res >= 16, Res < 18 -> triangle_up(12, 16, Res, Factor);
		Res >=18 -> Factor is 1;
        Factor is 0
    ).	
	
availability_factor(Podarek, Factor) :-
    availability_short_range(Podarek, ShortFactor),
    availability_mediumlong_range(Podarek, MediumLongFactor),
    availability_long_range(Podarek, LongFactor),
    map_availability_to_availability_factor(short, ShortMappedFactor),
    map_availability_to_availability_factor(mediumlong, MediumLongMappedFactor),
    map_availability_to_availability_factor(long, LongMappedFactor),
    sharpen(
        [ShortFactor, MediumLongFactor, LongFactor],
        [ShortMappedFactor, MediumLongMappedFactor, LongMappedFactor],
        Factor
    ).
	
availability_short_range(Podarek, Factor) :-
    db:availability(Podarek, Availability),
    (
        Availability < 1 -> Factor is 1;
        Availability >= 1, Availability < 3 -> triangle_down(1, 3, Availability, Factor);
        Factor is 0
    ).

availability_mediumlong_range(Podarek, Factor) :-
    db:availability(Podarek, Availability),
    (
        Availability >= 1, Availability < 3 -> triangle_up(1, 3, Availability, Factor);
        Availability >= 3, Availability < 7 -> triangle_down(3, 7, Availability, Factor);
        Factor is 0
    ).

availability_long_range(Podarek, Factor) :- 
    db:availability(Podarek, Availability),
    (
        Availability >= 3, Availability < 7 -> triangle_up(3, 7, Availability, Factor);
        Availability >= 7 -> Factor is 1;
        Factor is 0
    ).
	
	
age_factor(Podarek, Factor) :-
    age_new_range(Podarek, NewFactor),
    age_mediumold_range(Podarek, MediumOldFactor),
    age_old_range(Podarek, OldFactor),
    map_age_to_age_factor(new, NewMappedFactor),
    map_age_to_age_factor(mediumold, MediumOldMappedFactor),
    map_age_to_age_factor(old, OldMappedFactor),
    sharpen(
        [NewFactor, MediumOldFactor, OldFactor],
        [NewMappedFactor, MediumOldMappedFactor, OldMappedFactor],
        Factor
    ).
	
age_new_range(Podarek, Factor) :-
    db:age(Podarek, Age),
    (
        Age < 3 -> Factor is 1;
        Age >= 3, Age < 5 -> triangle_down(3, 5, Age, Factor);
        Factor is 0
    ).

age_mediumold_range(Podarek, Factor) :-
    db:age(Podarek, Age),
    (
        Age >= 3, Age < 5 -> triangle_up(3, 5, Age, Factor);
        Age >= 5, Age < 7 -> Factor is 1;
        Age >= 7, Age < 10 -> triangle_down(7, 10, Age, Factor);
        Factor is 0
    ).

age_old_range(Podarek, Factor) :- 
    db:age(Podarek, Age),
    (
        Age >= 7, Age < 10 -> triangle_up(7, 10, Age, Factor);
        Age >= 10 -> Factor is 1;
        Factor is 0
    ).
	
	
popularity_factor(Podarek, Factor) :-
    popularity_unpopular_range(Podarek, UnpopularFactor),
    popularity_mediumpopular_range(Podarek, MediumPopularFactor),
    popularity_popular_range(Podarek, PopularFactor),
    map_popularity_to_popularity_factor(unpopular, UnpopularMappedFactor),
    map_popularity_to_popularity_factor(mediumpopular, MediumPopularMappedFactor),
    map_popularity_to_popularity_factor(popular, PopularMappedFactor),
    sharpen(
        [UnpopularFactor, MediumPopularFactor, PopularFactor],
        [UnpopularMappedFactor, MediumPopularMappedFactor, PopularMappedFactor],
        Factor
    ).
	
popularity_unpopular_range(Podarek, Factor) :-
    db:popularity(Podarek, Popularity),
    (
        Popularity < 1 -> Factor is 1;
        Popularity >= 1, Popularity < 4 -> triangle_down(1, 4, Popularity, Factor);
        Factor is 0
    ).

popularity_mediumpopular_range(Podarek, Factor) :-
    db:popularity(Podarek, Popularity),
    (
        Popularity >= 1, Popularity < 4 -> triangle_up(1, 4, Popularity, Factor);
        Popularity >= 4, Popularity < 6 -> Factor is 1;
        Popularity >= 6, Popularity < 8 -> triangle_down(6, 8, Popularity, Factor);
        Factor is 0
    ).

popularity_popular_range(Podarek, Factor) :- 
    db:popularity(Podarek, Popularity),
    (
        Popularity >= 6, Popularity < 8 -> triangle_up(6, 8, Popularity, Factor);
        Popularity >= 8 -> Factor is 1;
        Factor is 0
    ).
	
	
dangereous_factor(Podarek, Factor) :-
    dangereous_safe_range(Podarek, SafeFactor),
    dangereous_mediumdanger_range(Podarek, MediumDangerFactor),
    dangereous_dangereous_range(Podarek, DangereousFactor),
    map_dangereous_to_dangereous_factor(safe, SafeMappedFactor),
    map_dangereous_to_dangereous_factor(mediumdanger, MediumDangerMappedFactor),
    map_dangereous_to_dangereous_factor(dangereous, DangereousMappedFactor),
    sharpen(
        [SafeFactor, MediumDangerFactor, DangereousFactor],
        [SafeMappedFactor, MediumDangerMappedFactor, DangereousMappedFactor],
        Factor
    ).
	
dangereous_safe_range(Podarek, Factor) :-
    db:dangereous(Podarek, Dangereous),
    (
        Dangereous < 0.2 -> Factor is 1;
        Dangereous >= 0.2, Dangereous < 0.4 -> triangle_down(0.2, 0.4, Dangereous, Factor);
        Factor is 0
    ).

dangereous_mediumdanger_range(Podarek, Factor) :-
    db:dangereous(Podarek, Dangereous),
    (
        Dangereous >= 0.2, Dangereous < 0.4 -> triangle_up(0.2, 0.4, Dangereous, Factor);
        Dangereous >= 0.4, Dangereous < 0.6 -> Factor is 1;
        Dangereous >= 0.6, Dangereous < 0.8 -> triangle_down(0.6, 0.8, Dangereous, Factor);
        Factor is 0
    ).

dangereous_dangereous_range(Podarek, Factor) :- 
    db:dangereous(Podarek, Dangereous),
    (
        Dangereous >= 0.6, Dangereous < 0.8 -> triangle_up(0.6, 0.8, Dangereous, Factor);
        Dangereous >= 0.8 -> Factor is 1;
        Factor is 0
    ).
	
size_factor(Podarek, Factor) :-
    size_small_range(Podarek, SmallFactor),
    size_mediumbig_range(Podarek, MediumBigFactor),
    size_big_range(Podarek, BigFactor),
    map_size_to_size_factor(small, SmallMappedFactor),
    map_size_to_size_factor(mediumbig, MediumBigMappedFactor),
    map_size_to_size_factor(big, BigMappedFactor),
    sharpen(
        [SmallFactor, MediumBigFactor, BigFactor],
        [SmallMappedFactor, MediumBigMappedFactor, BigMappedFactor],
        Factor
    ).
	
size_small_range(Podarek, Factor) :-
    db:size(Podarek, Size),
    (
        Size < 0 -> Factor is 1;
        Size >= 0, Size < 1 -> triangle_down(0, 1, Size, Factor);
        Factor is 0
    ).

size_mediumbig_range(Podarek, Factor) :-
    db:size(Podarek, Size),
    (
        Size >= 1, Size < 2 -> triangle_up(1, 2, Size, Factor);
        Size >= 2, Size < 5 -> Factor is 1;
        Size >= 5, Size < 10 -> triangle_down(5, 10, Size, Factor);
        Factor is 0
    ).

size_big_range(Podarek, Factor) :- 
    db:size(Podarek, Size),
    (
        Size >= 5, Size < 10 -> triangle_up(5, 10, Size, Factor);
        Size >= 10 -> Factor is 1;
        Factor is 0
    ).
	
	
triangle_down(Left, Right, Value, Factor) :-
    Factor is (Right - Value) / (Right - Left).

triangle_up(Left, Right, Value, Factor) :-
    Factor is (Value - Left) / (Right - Left).

sharpen(Factors, FactorMappedValues, Result) :-
    sum_prods_list(Factors, FactorMappedValues, Numerator),
    sum_list(Factors, Denominator),
    (
        Denominator == 0 -> Result is 0;
        Result is Numerator / Denominator
    ).

sum_prods_list([], [], 0).
sum_prods_list([H_left|T_left], [H_right|T_right], Product) :- 
    sum_prods_list(T_left, T_right, Rest), 
    Product is (H_left * H_right) + Rest.

sum_list([], 0).
sum_list([H|T], Sum) :-
   sum_list(T, Rest),
   Sum is H + Rest.