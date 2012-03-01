-module(data_storage).
-compile(export_all).

%% DETS, ETS, ejabber, Mnesia ????

%% Only to be used while booting up the server  %%

crete_db_wdefault(Name)->
    Args = [{auto_save,180000},{repair,true},{type,set}],
    create_database(Name,Args).

%% Returns {ok,Name}|{error,Reason}  %%
create_database(Name,Args)->
    case dets:open_file(Name,Args) of 
	%%{error,_Reason}->   %% need to do defencive code ????
	
	{ok,Name}->
	    ok;
	_ ->
	    failed
    end.


