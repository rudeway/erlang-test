-module(forfun).
-export([test_for/1]).

test_for(N) -> forfun(1,N,f1()).

forfun(N, N, f1) -> [f1()];
forfun(I, N, f1) -> [f1()|forfun(I+1,N,f1())].

f1() -> 
    io:format("hi~n").