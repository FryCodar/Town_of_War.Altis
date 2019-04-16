If(isMultiplayer)then{if(hasInterface) exitWith{};};
#include "msot_components.hpp"
/* --------------------------------------------------------------------------------------------------------------
Function: MSOT_acm_fnc_getPlayerZone

Description: Find the center and radius of player positions in a specific area.

Parameters: [POSITION,RADIUS]

            (optional) POSITION          -     ARRAY with Coordinates
            (optional) RADIUS            -     NUMBER of Search radius

Returns: Array for Every Group with [AVERAGE_POSITION_ARRAY,RADIUS,AVERAGE_DIRECTION]

Examples:
            _isStored = [(getMarkerPos "Town"),1000] call MSOT_acm_fnc_getPlayerZone;

Author: Fry

----------------------------------------------------------------------------------------------------------------- */
private ["_i","_found_grp","_units_in_grp","_vec_list","_data_list","_fill_list","_count_num","_average_pos","_average_radius","_all_x","_all_y","_all_dir","_dist"];
params [["_search_pos",[]],["_search_radius",0]];

private _output = [];
private _grp_list = [];


private _player_list = If(isMultiplayer)then{(allPlayers - entities "HeadlessClient_F")}else{switchableUnits};
{_grp_list pushBackUnique (group _x);}forEach _player_list;

F_LOOP(_i,0,((count _grp_list) - 1))
{
  _vec_list = [];
  _data_list = [];
  _fill _list = [];
  _found_grp = (_grp_list select _i);
  _units_in_grp = (units _found_grp);
  {If(!(isNull (objectParent _x)))then{If(!((objectParent _x) isKindOf "Air"))then{_vec_list pushBackUnique (objectParent _x);_units_in_grp = _units_in_grp - [_x];}else{_units_in_grp = _units_in_grp - [_x];};};}forEach (units _found_grp);
  If(count _vec_list > 0)then{{ARR_ADDVAR(_units_in_grp,_x);}forEach _vec_list;};
  If(count _units_in_grp > 0)then
  {
    If((count _search_pos) > 0 && {_search_radius > 0})then
    {
      {If(alive _x && {(_x distance2D _search_pos) >= _search_radius})then{_data_list pushBack [(position _x),(getDir _x)];};}forEach _units_in_grp;
    }else{{If(alive _x)then{_data_list pushBack [(position _x),(getDir _x)];};}forEach _units_in_grp;};
  };
  If(count _data_list > 0)then
  {
    _count_num = (count _data_list);
    _average_pos = [];
    _average_radius = 0;
    _all_x = 0;
    _all_y = 0;
    _all_dir = 0;
    {
      _all_x = _all_x + ((_x select 0) select 0);
      _all_y = _all_y + ((_x select 0) select 1);
      _all_dir = _all_dir + (_x select 1);
    }forEach _data_list;
    _average_pos = [(round(_all_x / _count_num)),(round(_all_y / _count_num)),0];
    {_dist = (round(_x distance2D _average_pos)); If(_dist > _average_radius)then{_average_radius = _dist;};}forEach _units_in_grp;
    If(count _search_pos > 0 && _search_radius > 0)then
    {
      If((_average_pos distance2D _search_pos) >= _search_radius)then
      {
        _output pushBack [_found_grp,[_average_pos,_average_radius,(round(_all_dir / _count_num))]];
      };
    }else{
            _output pushBack [_found_grp,[_average_pos,_average_radius,(round(_all_dir / _count_num))]];
         };
  };
  sleep 0.04;
};
_output
