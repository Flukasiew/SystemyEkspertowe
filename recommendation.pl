:- module(recommendation, [recommend/2]).

:- use_module(reasoning).
:- use_module(variables).

recommend(Answers, FactorWithGiftPairsResult) :-
    findall(
        Factor-Gift,
        calculate_gift_recommendation_factor(Answers, Gift, Factor),
        FactorWithGiftPairs),
    keysort(FactorWithGiftPairs, SortedFactorWithGiftPairs),
    reverse(SortedFactorWithGiftPairs, FactorWithGiftPairsResult).

calculate_gift_recommendation_factor([Cost, Popularity], Gift, Factor) :-
    get_popularity_factor(Popularity, Gift, PopularityFactor),
    get_cost_factor(Cost, Gift, CostFactor),
    RecommandationFactors = [
        CostFactor,
        PopularityFactor
    ],
    sum_list_elements(RecommandationFactors, RecommandationFactorsSum),
    Factor is RecommandationFactorsSum / 2,
    true.


get_cost_factor(Cost, Gift, Factor) :-
    map_wealth_to_factor(Cost, TargetFactor),
    cost_factor(Gift, CostFactor),
    Factor is 1 - abs(TargetFactor - CostFactor).

get_popularity_factor(Popularity, Gift, Factor) :-
    map_popularity_to_factor(Popularity, TargetFactor),
    popularity_factor(Gift, PopularityFactor),
    Factor is 1 - abs(TargetFactor - PopularityFactor).

sum_list_elements([], 0).
sum_list_elements([ListHeader|ListTailElements], Sum) :-
    sum_list_elements(ListTailElements, TailElementsSum),
    Sum is ListHeader + TailElementsSum.

