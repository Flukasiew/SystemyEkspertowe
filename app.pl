:- module(app, [recommender_menu/0]).

:- use_module(interface).
:- use_module(recommendation).
:- use_module(variables).

recommender_menu :-
	format('Rekomendacje podarkow~n'),
    format('Odpowiedz na pytania by otrzymac rekomendacje~n'),
	read_answers(Answers),
	format('Nasze rekomendacje [0-100]:~n'),
    show_recommendations(Answers).

show_recommendations(Answers) :-
    recommend(Answers, FactorWithPodarekPairs),
    print_results(FactorWithPodarekPairs).

print_results([]) :- 
	format('~n').

print_results([FactorWithPodarekPairsHead|FactorWithPodarekPairsTail]) :-
	get_key_and_value(FactorWithPodarekPairsHead, Factor, Podarek),
	FactorPercentage is Factor * 100,
	format('~2f% ~w ~n', [FactorPercentage, Podarek]),
	print_results(FactorWithPodarekPairsTail).

get_key_and_value(KeyValuePair, Key, Value) :-
	pairs_keys_values([KeyValuePair], [Key], [Value]).
