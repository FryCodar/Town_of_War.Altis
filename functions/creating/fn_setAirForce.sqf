If(isMultiplayer)then{if(hasInterface) exitWith{};};
#include "msot_components.hpp"
/* --------------------------------------------------------------------------------------------------------------
Function: MSOT_creating_fnc_setAirForce

Description: Creates defined Air Vehicles.

              SERVER/HEADLESS CLIENT

Parameters: [POSITION,RADIUS,NUMBER AIR,(VEHICLE CLASSNAME),(BEHAVIORMODE),(COMBATMODE)]

            POSITION  -  ARRAY with Position or ARRAY with 2 Position Arrays
                         1 Position array is the Main- and Spawnposition together to add the Vehicles in System
                         2 Position arrays the 1st is the Main position to add the Air Vehicles in System & the 2nd to spawn the Air Vehicles on Battlefield

            RADIUS    -  the Distance where the Vehicles will spawn around the Spawnpoint

            NUMBER AIR -  NUMBER of Air Vehicles

            (VEHICLE CLASSNAME) - define your own Class to spawn a Air Vehicle

            (BEHAVIORMODE) - Optional: default "CARELESS"

            (COMBATMODE)   - Optional : default "YELLOW"



Returns: [ARRAY with Names of all created Air Vehicles]

Examples:
            _isStored = [(getMarkerPos "start"), 200,5] spawn MSOT_creating_fnc_setUnits;

Author: Fry

----------------------------------------------------------------------------------------------------------------- */
private ["_output","_main_pos","_spawn_pos","_type","_grp_arr","_vec_arr","_i","_air_grp","_new_vec_type","_air_vec","_dir"];
params ["_air_pos","_radius","_air_num",["_vec_type",""],["_behaviour","COMBAT"],["_combat_mode","YELLOW"]];

_output = [];_main_pos = []; _spawn_pos = [];

switch(true)do
{
  case (typeName (_air_pos select 0) == "ARRAY" && typeName (_air_pos select 1) == "ARRAY"):{_main_pos = (_air_pos select 0);_spawn_pos = (_air_pos select 1);};
  case (typeName (_air_pos select 0) == "SCALAR" && typeName (_air_pos select 1) == "SCALAR"):{_main_pos = _air_pos;_spawn_pos = _air_pos;};
};

_type = If(count _vec_type > 0 && {isClass (configFile >> "cfgVehicles" >> _vec_type)})then{[_vec_type]}else{MSOT_AIRFORCE};

If(count _type > 0)then
{
  _grp_arr = [];_vec_arr = [];
  F_LOOP(_i,1,_air_num)
  {
   _air_grp = CREA_GROUP(MSOT_ENEMY_SIDE);
   _air_vec = [];
   _new_vec_type = If(count _type > 1)then{selectRandom _type}else{(_type # 0)};
   If(_main_pos isEqualTo _spawn_pos)then
   {
     _air_vec = [[(_main_pos select 0),(_main_pos select 1),((_main_pos select 2) + 100)],(random 360),_new_vec_type,_air_grp] call BFUNC(spawnVehicle);
   }else{
          _dir = _spawn_pos getDir _main_pos;
          _air_vec = [[(_spawn_pos select 0),(_spawn_pos select 1),((_spawn_pos select 2) + 100)],(random 360),_new_vec_type,_air_grp] call BFUNC(spawnVehicle);
        };
   If(count _air_vec > 0)then
   {
     ARR_ADDVAR(_vec_arr,(_air_vec select 0));
     ARR_ADDVAR(_grp_arr,(_air_vec select 2));
     (_air_vec select 0) addEventHandler ["Engine",{(_this select 0) setFuel 1;(_this select 0) engineOn true;}];
     [(_air_vec select 2)] call MFUNC(system,setUnitSkill);
     (_air_vec select 2) setBehaviour _behaviour;
     (_air_vec select 2) setCombatMode _combat_mode;
     [(_air_vec select 2),_main_pos,_radius] call BFUNC(taskPatrol);
     (_air_vec select 2) setSpeedMode "NORMAL";
   };
   if(_air_num > 1)then{sleep 10;};
  };
  If(count _grp_arr > 0)then{["GROUPS",_main_pos,_grp_arr] spawn MFUNC(system,addToSystem);};
  If(count _vec_arr > 0)then{
                                _output = _vec_arr;
                                ["VEHICLES",_main_pos,_vec_arr] spawn MFUNC(system,addToSystem);
                            };
}else{LOG_ERR("NO AIR VEHICLE CLASSES FOUND: CHECK MSOT_creating_fnc_setAirForce");};
_output
