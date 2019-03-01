If(isMultiplayer)then{if(hasInterface) exitWith{};};
#include "msot_components.hpp"
/* --------------------------------------------------------------------------------------------------------------
Function: MSOT_acm_fnc_getPlayerZone

Description: Find the center and radius of player positions in a specific area.

Parameters: [POSITION,RADIUS]

            POSITION          -     ARRAY with Coordinates
            RADIUS            -     NUMBER of Search radius

Returns: [AVERAGE_POSITION_ARRAY,RADIUS,AVERAGE_DIRECTION]

Examples:
            _isStored = [(getMarkerPos "Town"),1000] call MSOT_acm_fnc_getPlayerZone;

Author: Fry

----------------------------------------------------------------------------------------------------------------- */
params ["_search_pos","_search_radius"];

private _output = [];
private _obj_list = [];
private _data_list = [];
private _player_list = If(isMultiplayer)then{(allPlayers - entities "HeadlessClient_F")}else{switchableUnits};
{If(isNull objectParent _x)then{_obj_list pushBack _x;}else{_obj_list pushBackUnique (objectParent _x);};}forEach _player_list;
{If((_x distance2D _search_pos) <= _search_radius)then{_data_list pushBack [(position _x),(getDir _x)];};}forEach _obj_list;

If(count _data_list > 1)then
{
  private _count_num = (count _data_list);
  private _average_pos = [];
  private _average_radius = 0;
  private _average_dir = 0;
  private _all_x = 0;
  private _all_y = 0;
  private _all_dir = 0;
  {
    _all_x = _all_x + ((_x select 0) select 0);
    _all_y = _all_y + ((_x select 0) select 1);
    _all_dir = _all_dir + (_x select 1);
  }forEach _data_list;
  _average_pos = [(round(_all_x / _count_num)),(round(_all_y / _count_num)),0];
  {private _dist = (_x distance2D _average_pos); If(_dist > _average_radius)then{_average_radius = _dist;};}forEach _obj_list;
  _average_radius = _average_radius + 100;
  _output = [_average_pos,_average_radius,(round(_average_dir / _count_num))];
}else{_output = [((_data_list select 0) select 0),100,((_datalist select 0) select 1)];};
_output
