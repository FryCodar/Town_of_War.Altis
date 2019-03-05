If(isMultiplayer)then{if(hasInterface) exitWith{};};
#include "msot_components.hpp"
/* --------------------------------------------------------------------------------------------------------------
Function: MSOT_creating_fnc_setUnits

Description: Creates defined Vehicles on Battlefield.

              SERVER/HEADLESS CLIENT

Parameters: [POSITION,RADIUS,NUMBER VEHICLES,INDEX,LOCATION,(NIGHTMODE),(BEHAVIORMODE),(COMBATMODE)]

            POSITION  -  ARRAY with Position or ARRAY with 2 Position Arrays
                         1 Position array is the Main- and Spawnposition together to add the Vehicles in System
                         2 Position arrays the 1st is the Main position to add the Vehicles in System & the 2nd to spawn the Vehicles on Battlefield

            RADIUS    -  the Distance where the Vehicles will spawn around the Spawnpoint

            NUMBER VEHICLES -  NUMBER of all Vehicles

            INDEX          -  Index of Different Vehicle types (Vehicle Classnames available)
                             "CAR","APC","APC_AAIR","TANK","ARTY"

            LOCATION      -  Location where will spawn the Groups
                             "AREA" :   Everywhere on Area around the Spawnpoint
                             "BORDER" : Randomized Spawnpoint at the Border of Area

             (NIGHTMODE)    - Optional: default true

             (BEHAVIORMODE) - Optional: default "CARELESS"

             (COMBATMODE)   - Optional : default "YELLOW"



Returns: [ARRAY with Names of all created Vehicles]

Examples:
            _isStored = [(getMarkerPos "start"), 200,5, "CAR","AREA"] call MSOT_creating_fnc_setUnits;

Author: Fry

----------------------------------------------------------------------------------------------------------------- */
private ["_main_pos","_spawn_pos","_types_arr","_output","_i","_pos_idx","_posses_arr","_use_streets","_check_arr","_add_st_arr","_st_bl","_ch",
         "_n_st","_grp","_grp_store","_vec_store","_vec","_vec_type","_v_pos"];

params ["_pos","_radius","_num","_type","_location",["_is_night",(call MFUNC(usage,checkNight))],["_behavior","CARELESS"],["_combat","YELLOW"]];

_main_pos = []; _spawn_pos = []; _types_arr = [];_output = [];

switch(true)do
{
  case (typeName (_pos select 0) == "ARRAY" && typeName (_pos select 1) == "ARRAY"):{_main_pos = (_pos select 0);_spawn_pos = (_pos select 1);};
  case (typeName (_pos select 0) == "SCALAR" && typeName (_pos select 1) == "SCALAR"):{_main_pos = _pos;_spawn_pos = _pos;};
};
_types_arr = switch(_type)do
             {
               case "CAR":{MSOT_CARS};
               case "APC":{MSOT_APC};
               case "APC_AAIR":{MSOT_ANTIAIR};
               case "TANK":{MSOT_TANKS};
               case "ARTY":{MSOT_ARTILLERY};
               default {if(isClass (configFile >> "cfgVehicles" >> _type))then{[_type]}else{[]};};
             };

If(count _types_arr > 0)then
{
  _pos_idx = [1,2] select (_type In ["APC_AAIR","ARTY"]);
  _new_pos = []; _use_streets = false;
  If(_location isEqualTo "AREA")then
  {
    switch(_pos_idx)do
    {
      case 1:{
               _posses_arr = [_spawn_pos,_radius,true] call MFUNC(spawnhelp,getStreets);
               If(count _posses_arr >= _num)then
               {
                 _check_arr = []; _add_st_arr = [];
                 F_LOOP(_i,0,(_num - 1))
                 {
                   _st_bl = selectRandom _posses_arr;
                   _ch = 0;
                   while{_st_bl In _check_arr && _ch < 30}do{_st_bl = selectRandom _posses_arr;_ch = _ch + 1;};
                   ARR_ADDVAR(_add_st_arr,_st_bl);ARR_ADDVAR(_check_arr,_st_bl);
                 };
                 If(count _add_st_arr == _num)then
                 {
                   {_n_st = [_x,1] call MFUNC(spawnhelp,getStreetDir);ARR_ADDVAR(_new_pos,_n_st);}forEach _add_st_arr;
                   _use_streets = true;
                 };
               }else{_new_pos = _spawn_pos;};
             };
      case 2:{_new_pos = _spawn_pos;};
    };
  }else{
         If(!(_location isEqualTo "BORDER"))exitWith{};
         switch(_pos_idx)do
         {
           case 1:{
                    _st_bl = [_pos,(_radius * 3)] call MFUNC(spawnhelp,getStreetInDistance);
                    If(count _st_bl > 0)then
                    {
                      _new_pos = [_st_bl,_pos,_num] call MFUNC(spawnhelp,getStreetLine);
                      _use_streets = true;
                    }else{_new_pos = [_pos,(_radius * 3)] call MFUNC(geometry,getCircleBorderPos);};
                  };
           case 2:{
                    _new_pos = [_pos,(_radius * 3)] call MFUNC(geometry,getCircleBorderPos);
                  };
         };
       };
    If(count _new_pos > 0)then
    {
      _grp_store = []; _vec_store = [];
      F_LOOP(_i,0,(_num - 1))
      {
        _vec = [];
        _grp = CREA_GROUP(MSOT_ENEMY_SIDE);
        _vec_type = If(count _types_arr > 1)then{selectRandom _types_arr}else{(_types_arr # 0)};
        If(_use_streets)then
        {
          _v_pos = (_new_pos # _i);
          _vec = [(_v_pos # 0),(_v_pos # 1),_vec_type,_grp] call BFUNC(spawnVehicle);
        }else{
                switch(_location)do
                {
                  case "AREA":{
                                _v_pos = [_new_pos,_radius,10] call MFUNC(geometry,getCirclePos);
                                _vec = [_v_pos,(random 360),_vec_type,_grp] call BFUNC(spawnVehicle);
                              };
                  case "BORDER":{
                                  _v_pos = [(_new_pos # 0),_radius,10] call MFUNC(geometry,getCirclePos);
                                  _vec = [_v_pos,(_new_pos # 1),_vec_type,_grp] call BFUNC(spawnVehicle);
                                };
                };
             };
        If(count _vec > 0)then
        {
          ARR_ADDVAR(_vec_store,(_vec select 0));
          ARR_ADDVAR(_grp_store,(_vec select 2));
          [(_vec select 2)] call MFUNC(system,setUnitSkill);
          (_vec select 2) setBehaviour _behavior;
	        (_vec select 2) setCombatMode _combat;
          switch(_pos_idx)do
          {
            case 1:{
                     If(_location isEqualTo "BORDER")then
                     {
                       [(_vec select 2),_spawn_pos] call BFUNC(taskAttack);
                       (_vec select 2) setSpeedMode "LIMITED";
                     }else{
                            If(_is_night)then
                            {
                              (driver (_vec select 0)) action ["engineOff", (_vec select 0)];
                            }else{
                                  [(_vec select 2),_spawn_pos,(round(_radius * 0.5))] call BFUNC(taskPatrol);
                                  (_vec select 2) setSpeedMode "LIMITED";
                                 };
                          };
                   };
            case 2:{
                      (_vec select 0) setFuel 0;
                   };
          };
        };
      };
      _output = _vec_store;
      private _save_vecs = missionNameSpace getVariable [STRVAR_DO(save_in_system),true];
      If(count _grp_store > 0 && _save_vecs)then{["GROUPS",_main_pos,_grp_store] spawn MFUNC(system,addToSystem);};
      If(count _vec_store > 0 && _save_vecs)then{
                                                 ["VEHICLES",_main_pos,_vec_store] spawn MFUNC(system,addToSystem);
                                                 If(_type isEqualTo "ARTY")then{["ARTILLERY",_main_pos,_vec_store] spawn MFUNC(system,addToSystem);};
                                                };
    };
}else{LOG_ERR("NO VEHICLE CLASSES FOUND: CHECK MSOT_creating_fnc_setUnits");};
_output
