% Program: CW2 CS205.
% Submitted by 872108, no contribution made from 
% partner 'JUXHIN HALO'.
% 
% Queries are show as comments.
%--------------------------------------------------
%---------------- QUESTION_1 ----------------------
%--------------------------------------------------

% (a)
% parent(Parent, Child)
parent(queenmother,elisabeth). 
parent(elisabeth,charles). 
parent(elisabeth,andrew). 
parent(elisabeth,anne). 
parent(elisabeth,edward). 
parent(diana,william). 
parent(diana,harry). 
parent(sarah,beatrice). 
parent(anne,peter). 
parent(anne,zara). 
parent(george,elisabeth). 
parent(philip,charles). 
parent(philip,andrew). 
parent(philip,edward). 
parent(charles,william). 
parent(charles,harry). 
parent(andrew,beatrice). 
parent(andrew,eugenie). 
parent(mark,peter). 
parent(mark,zara). 
parent(william,georgejun). 
parent(kate,georgejun). 
parent(kate,charlotte).

% male(Person)
male(charles).
male(andrew).
male(edward).
male(william).
male(harry).
male(peter).
male(george).
male(philip).
male(mark).
male(georgejun).

% female(Person)
female(eugenie).
female(queenmother).
female(elisabeth).
female(diana).
female(anne).
female(beatrice).
female(kate).
female(charlotte).
female(sarah).
female(zara).

%mother/2
mother(X,Y) :- female(X),parent(X,Y).

%descendant/2
descendant(Person, Descendant) :-
        parent(Person, Child),
        descendant(Child, Descendant).
descendant(Person, Descendant) :-
        parent(Person, Descendant).

        
%grandparent/2        
grandparent(Grandparent, Grandchild) :-
	parent(Grandparent, Child),
	parent(Child, Grandchild).       
    
%ancestor/2       
ancestor(Person, Ancestor) :-
        parent(Parent, Person),
        ancestor(Parent, Ancestor).   
ancestor(Person, Ancestor) :-
        parent(Ancestor, Person). 
        
% countDescendants/2
countDescendants(Person, Count) :-
    findall(Decendant, descendant(Person,Decendant), List),
    listCount(List, Count).
    
% listCount/2
listCount([], 0).
listCount([_|Tail], Count) :-
    listCount(Tail, TailCount),
    Count is TailCount + 1.   
    
% siblings/2
siblings(A,B) :-
    parent(X, A),       % A & B share a common parent
    parent(X,B),         %
    A \== B.             % A is different from B  (Bratko, p175)
    
% siblingList/2
siblingList(Child, _Siblings) :-
	findall(Sibling, siblings(Child, Sibling), _List).
    
% sister/2
sister(X,Y) :- female(X),parent(Par,X),parent(Par,Y), X \= Y.

% aunt/2
aunt(X,Y) :- female(X),sister(X,Dad),father(Dad,Y).
aunt(X,Y) :- female(X),sister(X,Mom),mother(Mom,Y).

% father/2
father(X,Y) :- male(X),parent(X,Y).
    
%--------------------------------------------------
%----------------- SOLUTIONS ----------------------
%--------------------------------------------------

% (1) the_royal_females/1 
% INPUT: female(Person).

% (2) the_royal_males/1
% INPUT: male(Person).

% (3) the_royal_family/1 
% INPUT: descendant(Person, Descendant)

% (4) mother/2 
% INPUT: mother(X,Y).

% (5) has_child/1.
% INPUT: parent(Parent,Child).

% (6) grandparent/2 
% INPUT: grandparent(Grandparent, Grandchild).

% (7) ancestor/2 (use recursion). 
% INPUT: ancestor(Person, Ancestor).
        
% (8) Who is the mother of Beatrice? 
% INPUT: mother(X,beatrice).

% (9) Who has four or more descendants? 
% countDescendants(Person, (Count > 4)).

% (10) Who is a descendant of the Queenmother?
% INPUT: descendant(Queenmother, Ancestor).

% (b) [Query: Who are the siblings of Charles? Who are the annts of William?] 
% INPUT: siblings(A,B).
% INPUT: aunt(X,william).

% (c) Writeapredicate showPattern(N),
% which takes an integer N and prints the following patterns, 
% e.g., for N=3 and N=6, respectively.

% INPUT: showPattern(3). 
% INPUT: showPattern(6). 

showPattern(0).
showPattern(I) :-
    I>0,
    create(I),
    I2 is I-1,
    showPattern(I2),
    create(I).
    
create(0) :- nl.
create(I) :-
    I>0,
    write("*"),
    I2 is I-1,
    create(I2).
    
% (d) Given n distinct objects, the notation, which is known as the multinomial coefﬁcient, 

%--------------------------------------------------
%---------------- QUESTION_2 ----------------------
%--------------------------------------------------
% 1) Set Initial State.
% 2) Set Goal state.

% Moves.
% 1) 2 missionaries cross a -> b.
% 2) 2 cannibals cross a -> b.
% 3) 1 missionary 2 cannibals cross a-> b.
% 4) 1 missionary a -> b.
% 5) 1 cannibal crosses a -> b.
% 6) 2 missionaries cross b -> a.
% 7) 2 cannibals cross b -> a.
% 8) 1 missionary and 1 cannibal cross b -> a.
% 9) 1 missionary cross b -> a.
% 10) 1 cannibal crosses b -> a.

% Recursion.

% Solution.

% Write (Print) Solution.