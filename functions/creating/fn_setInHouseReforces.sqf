If(isMultiplayer)then{if(hasInterface) exitWith{};};
#include "msot_components.hpp"

/* --------------------------------------------------------------------------------------------------------------
Function: MSOT_creating_fnc_setInHouseReforces

Description: Creates Groups of Units on Battlefield.


Author: Fry

----------------------------------------------------------------------------------------------------------------- */
private ["_main_pos","_spawn_pos"];
params ["_position","_min_radius","_angle","_grp_num","_units_in_grp_num","_group_choice","_location_idx",["_behaviour_idx","CARELESS"],["_combat_idx","YELLOW"]];


IF(count MSOT_MEN == 0 && count MSOT_SFMEN == 0) exitWith {LOG_ERR("Control MSOT_MEN ARRAY");};

private _output = [];
private _do_your_job = If(_group_choice != "CIV_MEN")then{true}else{false};
If(_do_your_job)then
{
  switch(true)do
  {
    case (typeName (_position select 0) == "ARRAY" && typeName (_position select 1) == "ARRAY"):{_main_pos = (_position select 0);_spawn_pos = (_position select 1);};
    case (typeName (_position select 0) == "SCALAR" && typeName (_position select 1) == "SCALAR"):{_main_pos = _position;_spawn_pos = _position;};
  };

  private _houses_arr = [_spawn_pos,(_min_radius + 100),true,true] call MFUNC(spawnhelp,checkHouses);
  If(count _houses_arr > 0)then
  {
    private _selected_houses = [];
    private _ran_angle = (random _angle);
    private _max_radius = (_min_radius + 50);
    private _right_angle = if((_ran_angle + 45) > 360)then{(_ran_angle + 45) - 360}else{(_ran_angle + 45)};
    private _left_angle = if((_ran_angle - 45) < 0)then{(_ran_angle - 45) + 360}else{(_ran_angle - 45)};

    _selected_houses = (_houses_arr select {(_x distance _spawn_pos) >= _min_radius && {(_x distance _spawn_pos) <= _max_radius} && {(_spawn_pos getDir _x) >= _left_angle} && {(_spawn_pos getDir _x) <= _right_angle}});
    If(count _selected_houses > 0)then
    {
      hint str _selected_houses;
    };
  };
};
