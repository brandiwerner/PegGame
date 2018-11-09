:- use_module(library(lambda)).

% First game that has the 1st peg missing
start0 :-
	pegPuzzle0(ListMoves),
	show0(ListMoves).	
	
% Second game that has the 2nd peg missing
start1 :-
	pegPuzzle1(ListMoves),
	show1(ListMoves).		

% Third game that has the 3rd peg missing
start2 :-
	pegPuzzle2(ListMoves),
	show2(ListMoves).

% Fourth game that has the 4th peg missing
start3 :-
	pegPuzzle3(ListMoves),
	show3(ListMoves).

% Fifth game that has the 5th peg missing
start4 :-
	pegPuzzle4(ListMoves),
	show4(ListMoves).

% Functions that simulate the game
solve(_, [_], List, ListMoves) :-
	reverse(List, ListMoves).
 
solve(Free, Occupied, List, ListMoves) :-
	% Getting the start, open, and End peg for the next move
	select(StartPeg, Occupied, OList1),
	select(OpenPeg, OList1, OList2),
	select(EndPeg, Free, List1),
	move(StartPeg, OpenPeg, EndPeg),
	% Calling solve recursevely 
	solve([StartPeg, OpenPeg | List1], [EndPeg | OList2], [move(StartPeg,OpenPeg,EndPeg) | List], ListMoves).	

% Peg Puzzle Functions
pegPuzzle0(ListMoves) :-
	% solve First game with location 0 missing
	solve([1], [2,3,4,5,6,7,8,9,10,11,12,13,14,15], [], ListMoves).
pegPuzzle1(ListMoves) :-
	solve([2], [1,3,4,5,6,7,8,9,10,11,12,13,14,15], [], ListMoves).	
pegPuzzle2(ListMoves) :-
	solve([3], [1,2,4,5,6,7,8,9,10,11,12,13,14,15], [], ListMoves).	
pegPuzzle3(ListMoves) :-
	solve([4], [1,2,3,5,6,7,8,9,10,11,12,13,14,15], [], ListMoves).	
pegPuzzle4(ListMoves) :-
	solve([5], [1,2,3,4,6,7,8,9,10,11,12,13,14,15], [], ListMoves).	

%Moves in the game
move(StartPeg,2,EndPeg) :-
	member([StartPeg,EndPeg], [[1,4], [4,1]]).
move(StartPeg,3,EndPeg) :-
	member([StartPeg,EndPeg], [[1,6], [6,1]]).
move(StartPeg,4,EndPeg):-
	member([StartPeg,EndPeg], [[2,7], [7,2]]).
move(StartPeg,5,EndPeg):-
	member([StartPeg,EndPeg], [[2,9], [9,2]]).
move(StartPeg,5,EndPeg):-
	member([StartPeg,EndPeg], [[3,8], [8,3]]).
move(StartPeg,6,EndPeg):-
	member([StartPeg,EndPeg], [[3,10], [10,3]]).
move(StartPeg,7,EndPeg):-
	member([StartPeg,EndPeg], [[4,11], [11,4]]).
move(StartPeg,8,EndPeg):-
	member([StartPeg,EndPeg], [[4,13], [13,4]]).
move(StartPeg,8,EndPeg):-
	member([StartPeg,EndPeg], [[5,12], [12,5]]).
move(StartPeg,9,EndPeg):-
	member([StartPeg,EndPeg], [[5,14], [14,5]]).
move(StartPeg,9,EndPeg):-
	member([StartPeg,EndPeg], [[6,13], [13,6]]).
move(StartPeg,10,EndPeg):-
	member([StartPeg,EndPeg], [[6,15], [15,6]]).
move(StartPeg,5,EndPeg):-
	member([StartPeg,EndPeg], [[4,6], [6,4]]).
move(StartPeg,8,EndPeg):-
	member([StartPeg,EndPeg], [[7,9], [9,7]]).
move(StartPeg,9,EndPeg):-
	member([StartPeg,EndPeg], [[8,10], [10,9]]).
move(StartPeg,12,EndPeg):-
	member([StartPeg,EndPeg], [[11,13], [13,11]]).
move(StartPeg,13,EndPeg):-
	member([StartPeg,EndPeg], [[12,14], [14,12]]).
move(StartPeg,14,EndPeg):-
	member([StartPeg,EndPeg], [[13,15], [15,13]]).
 
 
%Printing out the boards base on which peg is missing
show0(Win) :-
	show(Win, [1]).
show1(Win) :-
	show(Win, [2]).
show2(Win) :-
	show(Win, [3]).	
show3(Win) :-
	show(Win, [4]).
show4(Win) :-
	show(Win, [5]).
		
%Printing out the last board		
show([], Open) :-
	numlist(1,15, PegList),
	%Mapping out the list of . and x over the PegList
	maplist(\X^Peg^(member(X, Open) -> Peg = '.'; Peg = 'x'),
		PegList,
		[Peg1,Peg2,Peg3,Peg4,Peg5,Peg6,Peg7,Peg8,Peg9,Peg10,Peg11,Peg12,Peg13,Peg14,Peg15]),
	%Printing the board from mapping
	format('      ~w        ~n', [Peg1]),
	format('     ~w ~w      ~n', [Peg2,Peg3]),
	format('    ~w ~w ~w    ~n', [Peg4,Peg5,Peg6]),
	format('   ~w ~w ~w ~w  ~n', [Peg7,Peg8,Peg9,Peg10]),
	format('  ~w ~w ~w ~w ~w~n', [Peg11,Peg12,Peg13,Peg14,Peg15]),
	writeln('Done').
 
 
show([move(Start, Middle, End) | Tail], Open) :-
	numlist(1,15, PegList),
	%Mapping out the list of . and x over the PegList
	maplist(\X^Peg^(member(X, Open) -> Peg = '.'; Peg = 'x'),
		PegList,
		[Peg1,Peg2,Peg3,Peg4,Peg5,Peg6,Peg7,Peg8,Peg9,Peg10,Peg11,Peg12,Peg13,Peg14,Peg15]),
	%Printing the board from mapping
	format('      ~w        ~n', [Peg1]),
	format('     ~w ~w      ~n', [Peg2,Peg3]),
	format('    ~w ~w ~w    ~n', [Peg4,Peg5,Peg6]),
	format('   ~w ~w ~w ~w  ~n', [Peg7,Peg8,Peg9,Peg10]),
	format('  ~w ~w ~w ~w ~w~n~n', [Peg11,Peg12,Peg13,Peg14,Peg15]),
	select(End, Open, List1),
	%Recurevely calling show
	show(Tail,  [Start, Middle | List1]).