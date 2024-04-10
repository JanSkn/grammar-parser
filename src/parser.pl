%%% Sentence %%%
s(s(NP, VP)) --> np(NP, Number, Person, nom, Animacy), vp(VP, Number, Person, _, Animacy).                   
%%% Noun phrase %%%
np(np(Det, nbar(N)), Number, Person, _, Animacy) --> det(Det, Number), np_rest(N, Number, Person, Animacy).     % noun phrase has arbitrary adjectives
np(np(Pronoun), Number, Person, Case, _) --> pro(Pronoun, Number, Person, Case, _).                             % pronoun (subject or object, depending on position)
np(np(pp(Prep, N)), _, _, Case, _) --> prep(Prep), np(N, _, _, Case, _).                                        % preposition base case
np(np(Det1, nbar(N1), pp(Prep, N2)), Number, Person, Case, Animacy) -->                                         % arbitrary prepositions
    det(Det1, Number), np_rest(N1, Number, Person, Animacy), prep(Prep), np(N2, _, _, Case, _).

np_rest(N, Number, Person, Animacy) --> n(N, Number, Person, Animacy).                                          % helper functions for noun phrase
np_rest(jp(Adj, N), Number, Person, _) --> adj(Adj), np_rest(N, Number, Person, _).
%%% Verb phrase %%%
vp(vp(V, NP), Number, Person, active, Animacy) --> v(V, Number, tv, Person, Animacy), np(NP, _, _, acc, _).     % either verb and object pronoun or new np
vp(vp(Aux, V, By, NP), Number, Person, passive, _) --> 
    aux(Aux, Number, Person), pastPart(V, Number, Person, _), byprep(By), np(NP, _, _, acc, _).
vp(vp(V), Number, Person, _, Animacy) --> v(V, Number, iv, Person, Animacy).                                    % special case --> intransitive; end of sentence


%%% Determiners %%%
det(det(Word), Number) --> [Word], {lex(Word, det, Number)}. 
%%% Nouns %%%
n(n(Word), Number, Person, Animacy) --> [Word], {lex(Word, n, Number, _, Person, Animacy)}. 
%%% Verbs %%%
v(v(Word), Number, Transitivity, Person, Animacy) --> [Word], {lex(Word, Transitivity, Number, Person, Animacy)}. 
pastPart(byPrepP(Word), Number, Person, _) --> [Word], {lex(Word, _, Number, Person, _)}. 
aux(aux(Word), Number, Person) --> [Word], {lex(Word, aux, Number, Person)}.
%%% Adjectives %%%
adj(adj(Word)) --> [Word], {lex(Word, adj)}.
%%% Pronouns %%%
pro(pro(Word), Number, Person, Case, Animacy) --> [Word], {lex(Word, pro, Number, Person, Case, Animacy)}.
%%% Prepositions %%%
prep(prep(Word)) --> [Word], {lex(Word, prep)}.
byprep(byPrep(Word)) --> [Word], {lex(Word, byPrep)}.

%%%%%%%%%%%% Lexicon %%%%%%%%%%%%%%

%%% Pronouns %%%
% For pronouns, the information appears in the following order: word, grammatical category (pronoun), number (singular/plural), grammatical person (1st, 2nd, or 3rd), and grammatical role (subject or object)
lex(i, pro, singular, 1, nom, ani). 
lex(you, pro, singular, 2, nom, ani). 
lex(he, pro, singular, 3, nom, ani). 
lex(she, pro, singular, 3, nom, ani). 
lex(it, pro, singular, 3, nom, ani).
lex(we, pro, plural, 1, nom, ani). 
lex(you, pro, plural, 2, nom, ani). 
lex(they, pro, plural, 3, nom, ani).
lex(me, pro, singular, 1, acc, ani). 
lex(you, pro, singular, 2, acc, ani). 
lex(him, pro, singular, 3, acc, ani). 
lex(her, pro, singular, 3, acc, ani). 
lex(it, pro, singular, 3, acc, ani).
lex(us, pro, plural, 1, acc, ani). 
lex(you, pro, plural, 2, acc, ani). 
lex(them, pro, plural, 3, acc, ani).

%%% Common Nouns %%%
% For common nouns, the information appears in the following order: word, grammatical category (noun), number
lex(man, n, singular, _, 3, ani). 
lex(woman, n, singular, _, 3, ani). 
lex(dog, n, singular, _, 3, ani). 
lex(apple, n, singular, _, 3, nani). 
lex(chair, n, singular, _, 3, nani). 
lex(room, n, singular, _, 3, nani).
lex(men, n, plural, _, _, ani). 
lex(women, n, plural, _, _, ani). 
lex(dogs, n, plural, _, _, ani). 
lex(apples, n, plural, _, _, nani). 
lex(chairs, n, plural, _, _, nani). 
lex(rooms, n, plural, _, _, nani).

%%% Verbs %%%
% For verbs, the information appears in the following order: word, grammatical category (verb), number (singular/plural), grammatical person (1st, 2nd, 3rd)

%%% Transitive Verbs %%%
lex(know, tv, singular, 1, ani). 
lex(know, tv, singular, 2, ani). 
lex(knows, tv, singular, 3, ani). 
lex(know, tv, plural, _, ani).
lex(see, tv, singular, 1, ani). 
lex(see, tv, singular, 2, ani). 
lex(sees, tv, singular, 3, ani). 
lex(see, tv, plural, _, ani).
lex(hire, tv, singular, 1, ani). 
lex(hire, tv, singular, 2, ani). 
lex(hires, tv, singular, 3, ani). 
lex(hire, tv, plural, _, ani).
lex(break, tv, singular, 1, ani). 
lex(break, tv, singular, 2, ani). 
lex(breaks, tv, singular, 3, ani). 
lex(break, tv, plural, _, ani).
lex(bite, tv, singular, 1, ani). 
lex(bite, tv, singular, 2, ani). 
lex(bites, tv, singular, 3, ani). 
lex(bite, tv, plural, _, ani).

%%% Past Participle %%%
% These verb forms are used in the passive.
% Only the tv verbs can be passivized. 
lex(broken, pastPart, singular, 1, _). 
lex(broken, pastPart, singular, 2, _). 
lex(broken, pastPart, singular, 3, _). 
lex(broken, pastPart, plural, _, _).
lex(bicen, pastPart, singular, 1, _). 
lex(bicen, pastPart, singular, 2, _). 
lex(bicen, pastPart, singular, 3, _). 
lex(bicen, pastPart, plural, _, _).
lex(known, pastPart, singular, 1, _). 
lex(known, pastPart, singular, 2, _). 
lex(known, pastPart, singular, 3, _). 
lex(known, pastPart, plural, _, _).
lex(seen, pastPart, singular, 1, _). 
lex(seen, pastPart, singular, 2, _). 
lex(seen, pastPart, singular, 3, _). 
lex(seen, pastPart, plural, _, _).
lex(hired, pastPart, singular, 1, _). 
lex(hired, pastPart, singular, 2, _). 
lex(hired, pastPart, singular, 3, _). 
lex(hired, pastPart, plural, _, _).
lex(broken, pastPart, singular, 1, _). 
lex(broken, pastPart, singular, 2, _). 
lex(broken, pastPart, singular, 3, _). 
lex(broken, pastPart, plural, _, _).
lex(bitten, pastPart, singular, 1, _). 
lex(bitten, pastPart, singular, 2, _). 
lex(bitten, pastPart, singular, 3, _). 
lex(bitten, pastPart, plural, _, _).

%%% Intransitive verbs %%%
% These cannot go into the passive.
lex(fall, iv, singular, 1, _). 
lex(fall, iv, singular, 2, _). 
lex(falls, iv, singular, 3, _). 
lex(fall, iv, plural, _, _).
lex(sleep, iv, singular, 1, ani). 
lex(sleep, iv, singular, 2, ani). 
lex(sleeps, iv, singular, 3, ani). 
lex(sleep, iv, plural, _, ani).

%%% Auxiliary verbs for the passive %%%
lex(am, aux, singular, 1). 
lex(are, aux, singular, 2). 
lex(is, aux, singular, 3). 
lex(are, aux, plural, _).

%%% Determiners %%%
% For determiners, the information appears in the following order: word, grammatical category (determiner), number
lex(the, det, _). 
lex(a, det, singular). 
lex(two, det, plural).

%%% Prepositions %%%
% For prepositions, the information appears in the following order: word, grammatical category (preposition)
lex(on, prep). 
lex(in, prep). 
lex(under, prep).

lex(by, byPrep).

%%% Adjectives %%%
% For adjectives, the information appears in the following order: word, grammatical category (adjective)
lex(old, adj). 
lex(young, adj). 
lex(red, adj). 
lex(short, adj). 
lex(tall, adj).