If(isMultiplayer)then{if(hasInterface) exitWith{};};
#include "msot_components.hpp"

/* --------------------------------------------------------------------------------------------------------------
Function: MSOT_creating_fnc_setInHouseReforces

Description: Creates Groups of Units in Houses of a specific Area and Distance at an Angle of 90 degress.

Parameters:   [POSITION,DISTANCE,DIRECTION,NUMBER GROUPS,NUMBER UNITS,GROUP INDEX,LOCATION,(BEHAVIORMODE),(COMBATMODE)]

              POSITION  -  ARRAY with Position or ARRAY with 2 Position Arrays
                          1 Positionarray is the Main- and Spawnposition together to add the Units in System
                          2 Positionarrays the 1st is the Mainposition to add the Units in System & the 2nd to spawn the Units on Battlefield

              DISTANCE  - NUMBER Distance to search for a position

              DIRECTION - NUMBER Direction to search for a Position

              NUMBER GROUPS -  NUMBER of all Groups

              NUMBER UNITS  -  Number of Units in the Group

              GROUP INDEX   -  Index of Different Classnames(if Classnames available!)
                               "NORMAL_UNITS","URBAN_UNITS","SPECIAL_UNITS","MIXED_NORMSPEC","MIXED_NORMSNIP","MIXED_ALL"

              (BEHAVIORMODE) - Optional: default "COMBAT"

              (COMBATMODE)   - Optional : default "YELLOW"

              !INFORMATION!: "CIV_MEN" at GROUP INDEX is not supported!

Returns: [ARRAY with Names of all created Groups]

Examples:

          _grps = [(getMarkerPos "Town"),150,270,3,5,"MIXED_ALL"] call MFUNC(creating,setInHouseReforces);

Author: Fry

----------------------------------------------------------------------------------------------------------------- */
private ["_main_pos","_spawn_pos","_i","_grp","_group_classes","_co","_get_house","_house_levels","_spawn_poses","_spawn_at_pos","_unit"];
params ["_position","_min_radius","_angle","_grp_num","_units_in_grp_num","_group_choice",["_behaviour_idx","COMBAT"],["_combat_idx","YELLOW"]];


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
    private _ran_angle = (round _angle);
    private _max_radius = (_min_radius + 50);
    private _right_angle = if((_ran_angle + 45) > 360)then{(_ran_angle + 45) - 360}else{(_ran_angle + 45)};
    private _left_angle = if((_ran_angle - 45) < 0)then{(_ran_angle - 45) + 360}else{(_ran_angle - 45)};
    private _check_arr = [];

    _selected_houses = (_houses_arr select {(_x distance _spawn_pos) >= _min_radius && {(_x distance _spawn_pos) <= _max_radius} && {(_spawn_pos getDir _x) >= _left_angle} && {(_spawn_pos getDir _x) <= _right_angle}});
    If(count _selected_houses > (_grp_num * 2))then
    {
      //Debug Mode
      If(!isMultiplayer && (["debug_modus",1] call BIS_fnc_getParamValue) == 1)then
      {{[(position _x),(str _x),"ICON",[1,1],"ColorRed","hd_dot"] call MFUNC(usage,setMapMarker);}forEach _selected_houses;};
      //______________________________________________________________________________________________________________________
     private _house_check = [];
     F_LOOP(_i,1,_grp_num)
     {
       _grp = CREA_GROUP(MSOT_ENEMY_SIDE);
       _group_classes = [_group_choice,_units_in_grp_num] call MFUNC(system,getWorkClasses);
       _co = 0;
       _get_house = (selectRandom _selected_houses);
       _house_levels = [_get_house,"LEVELS"] call MFUNC(spawnhelp,checkHousePos);
       While{(count _house_levels) < 2 && {_get_house In _house_check} && {_co <= 100}}do
       {
         _get_house = (selectRandom _selected_houses);
         _house_levels = [_get_house,"LEVELS"] call MFUNC(spawnhelp,checkHousePos);
         _co = _co + 1;
         sleep 1;
       };
       _spawn_poses = switch(count _house_levels)do
                      {
                        case 0:{[]};
                        case 1:{(_house_levels # 0)};
                        case 2:{(_house_levels # 1)};
                        case 3:{(_house_levels # 2)};
                        default {(_house_levels # 0)};
                      };
       If(count _spawn_poses > 0)then
       {
       ARR_ADDUNIVAR(_house_check,_get_house);
       {
         _spawn_at_pos = (selectRandom _spawn_poses);
         _unit = _grp createUnit [_x,_spawn_at_pos, [], 1,"CAN_COLLIDE"];
         SET_POSATL(_unit,_spawn_at_pos,0.01);
         sleep 0.04;
       }forEach _group_classes;
       _grp enableAttack true;
       _grp enableGunLights "AUTO";
       [_grp,_spawn_pos,(round(_min_radius * 0.5))] call BFUNC(taskPatrol);
       _grp setBehaviour _behaviour_idx;
       _grp setCombatMode _combat_idx;
       [_grp] call MFUNC(system,setUnitSkill);
       ARR_ADDVAR(_output,_grp);
     };
       sleep 0.04;
     };
     private _save_group = missionNameSpace getVariable [STRVAR_DO(save_in_system),true];
     If(count _output > 0 && _save_group)then{["GROUPS",_main_pos,_output] spawn MFUNC(system,addToSystem);}
    };
  };
};
_output
