function f_i = fitness1(x, p)

%This fitness function corresponds to a rock-paper-scissors game
 A = [ 0 -1  1;...
	   1  0 -1;...
      -1  1  0];

A = A + 2;

 f_i = A * x' ;
