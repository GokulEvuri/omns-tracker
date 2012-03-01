%%%-------------------------------------------------------------------
%%% @author lengor <lengor@lengor>
%%% @copyright (C) 2012, lengor
%%% @doc
%%%
%%% @end
%%% Created : 28 Feb 2012 by lengor <lengor@lengor>
%%%-------------------------------------------------------------------
-module(data_struct).

%%-export(add_hash/2,delete_hash/2,add_peer/3,delete_peer/3).
%% API
-compile(export_all).

%% -record(peer, {peer_time,{ip1,ip2,ip3,ip4}}). -Under Development

%% Returns a list with added peer
add_hash(Hash,List)->
    [{Hash,[]}|List].

delete_hash(Hash,List)->
    lists:keydelete(Hash, 1, List).

add_peer(Hash,Peer,List)->
    Peer_List = find(Hash,List),
    Appended_List = lists:append(Peer_List,{calendar:local_time(),Peer}),
    Deleted_List = delete_hash(Hash,List),
    [{Hash,Appended_List}|Deleted_List].

delete_peer(Hash,Peer,List)->
    Peer_List = find(Hash,List),
    lists:keydelete(Peer,2,Peer_List).

find(_Hash,[])->
    [];
find(Hash,[{Hash,PeerList}|_T])->
    PeerList;
find(Hash,[_|T]) ->
    find(Hash,T).
