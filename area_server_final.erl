-module(area_server_final).
-export([start/0, area/2]).

start()->spawn(fun loop/0).

area(Pid, What)->
    rpc(Pid, What).

rpc(Pid, Request)->
    Pid ! {self(), Request},
    receive
        Response-> 
            Response
        end.

%%Time = 5.

loop()->
    receive
        {From, {rectangle, Width, Ht}}->
            From ! Width * Ht,
            loop();
        {From, {circle, R}}->
            From ! 3.14159 * R * R,
            loop();
        {From, Other}->
            From ! {error, Other},
            loop()
    after 1000 ->
        io:format("hi~n")
    end.