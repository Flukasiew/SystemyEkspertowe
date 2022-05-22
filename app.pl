recommender_menu ::- module(app, [main/0]).

:- use_module(interface).
:- use_module(recommendation).
:- use_module(variables).

recommender_menu :-
	format('Rekomendacje podarkow~n'),
    format('Odpowiedz na pytania by otrzymac rekomendacje~n'),
	read_answers(Answers),
	format('Our recommendations [0-100]:~n'),
    show_recommendations(Answers).

show_recommendations(Answers) :-
    recommend(Answers, FactorWithGiftPairs),
    print_results(FactorWithGiftPairs).

print_results([]) :- 
	format('~n').

print_results([FactorWithGiftPairsHead|FactorWithGiftPairsTail]) :-
	get_key_and_value(FactorWithGiftPairsHead, Factor, Gift),
	FactorPercentage is Factor * 100,
	format('~2f% ~w ~n', [FactorPercentage, Gift]),
	print_results(FactorWithGiftPairsTail).

get_key_and_value(KeyValuePair, Key, Value) :-
	pairs_keys_values([KeyValuePair], [Key], [Value]).
