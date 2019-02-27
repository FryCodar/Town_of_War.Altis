If(!hasInterface) exitWith {};
#include "msot_components.hpp"

params ["_travel_index","_travel_pos","_travelheight"];

switch(_travel_index)do
{
  case 0:{
            cutText ["","BLACK",2];
            sleep 2;
            playSound "Topic_Selection";
            player setPos _travel_pos;
            cutText ["","BLACK IN",1];
         };
  case 1:{
            private _player = player;
            cutText ["","BLACK",2];
            sleep 2;
            playSound "Topic_Selection";
            private _loadout = getUnitLoadout _player;
            _player addBackpack "B_Parachute";
            [_player,true] remoteExec ["setCaptive",0];
            sleep 1;
            _player setPos [(_travel_pos # 0),(_travel_pos # 1),((_travel_pos # 2) + _travelheight)];
            cutText ["","BLACK IN",1];
            waitUntil{isTouchingGround _player};
            [_player,false] remoteExec ["setCaptive",0];
            _player setUnitLoadout _loadout;
         };
};
