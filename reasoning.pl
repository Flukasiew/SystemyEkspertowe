:- module(reasoning, 
    [
    cost_factor/2,
    popularity_factor/2
   ]).

:- use_module(variables).
:- use_module(db).

/* Price Range */
cost_factor(Podarek, Factor) :-
    tani_range(Podarek, TaniFactor),
    sredni_range(Podarek, SredniFactor),
    drogi_range(Podarek, DrogiFactor),
    map_wealth_to_factor(tani, TaniMappedFactor),
    map_wealth_to_factor(sredni, SredniMappedFactor),
    map_wealth_to_factor(drogi, DrogiMappedFactor),
    sharpen(
        [TaniFactor, SredniFactor, DrogiFactor],
        [TaniMappedFactor, SredniMappedFactor, DrogiMappedFactor],
        Factor
    ).

tani_range(Podarek, Factor) :-
    db:cost(Podarek, Cost),
    (
        Cost < 20 -> Factor is 1;
        Cost >= 20, Cost < 50 -> triangle_down(20, 50, Cost, Factor);
        Factor is 0
    ).

sredni_range(Podarek, Factor) :-
    db:cost(Podarek, Cost),
    (
        Cost >= 20, Cost < 30 -> triangle_up(20, 30, Cost, Factor);
        Cost >= 30, Cost < 60 -> Factor is 1;
        Cost >= 60, Cost < 100 -> triangle_down(60, 100, Cost, Factor);
        Factor is 0
    ).

drogi_range(Podarek, Factor) :- 
    db:cost(Podarek, Cost),
    (
        Cost >= 60, Cost < 80 -> triangle_up(60, 80, Cost, Factor);
        Cost >= 80 -> Factor is 1;
        Factor is 0
    ).

/* Popularity range */
popularity_factor(Podarek, Factor) :-
    malo_range(Podarek, MaloFactor),
    troche_range(Podarek, TrocheFactor),
    bardzo_range(Podarek, BardzoFactor),
    map_popularity_to_factor(malo, MaloMappedFactor),
    map_popularity_to_factor(troche, TrocheMappedFactor),
    map_popularity_to_factor(bardzo, BardzoMappedFactor),
    sharpen(
        [MaloFactor, TrocheFactor, BardzoFactor],
        [MaloMappedFactor, TrocheMappedFactor, BardzoMappedFactor],
        Factor
    ).

malo_range(Podarek, Factor) :-
    db:popularity(Podarek, Popularity),
    (
        Popularity < 2 -> Factor is 1;
        Popularity > 2, Popularity < 5 -> triangle_down(2, 5, Popularity, Factor);
        Factor is 0
    ).

troche_range(Podarek, Factor) :-
    db:popularity(Podarek, Popularity),
    (
        Popularity >= 2, Popularity < 4 -> triangle_up(2,4, Popularity, Factor);
        Popularity >= 4, Popularity < 6 -> Factor is 1;
        Popularity >= 6, Popularity < 10 -> triangle_down(6,10, Popularity, Factor);
        Factor is 0
    ).

bardzo_range(Podarek, Factor) :- 
    db:popularity(Podarek, Popularity),
    (
        Popularity >= 6, Popularity < 8 -> triangle_up(6,8, Popularity, Factor);
        Popularity >= 8 -> Factor is 1;
        Factor is 0
    ).

/* Helpers */
triangle_down(Left, Right, Price, Factor) :-
    Factor is (Right - Price) / (Right - Left).

triangle_up(Left, Right, Price, Factor) :-
    Factor is (Price - Left) / (Right - Left).

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