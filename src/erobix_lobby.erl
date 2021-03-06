%%%
%%% @doc Lobby service.
%%% @author David Dossot <david@dossot.net>
%%%
%%% See LICENSE for license information.
%%% Copyright (c) 2010 David Dossot
%%%

-module(erobix_lobby).
-author('David Dossot <david@dossot.net>').

-include("erobix.hrl").

-export([serve/1]).

serve(Req) ->
  Method = Req:get(method),
  
  case Method of
    'GET' ->
      erobix_lib:build_xml_response(Req, obj, attributes(), children());

    _ ->
      {error, bad_request}
  end.
  
%% Private function
attributes() ->
  [{is, "obix:Lobby"}].
  
children() ->
  % TODO add createObject op
  % TODO add findObjects op
  % TODO add batch op
  % TODO add watchService ref
  % TODO add alarms ref
  [
   {ref, [{name, "about"}, {href, "about/"}, {is, "obix:About"}], []},
   {ref, [{name, "objects"}, {href, "objects/"}, {display, "Managed objects"}], []}
  ].

