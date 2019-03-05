#include "msot_components.hpp"
/* --------------------------------------------------------------------------------------------------------------
Function: MSOT_curator_fnc_setObjectAttribute

Description: Set attributes to Object (Skill / Ownership)

Parameters:

Returns: Nothing

Examples:
            MSOT_curator_fnc_setObjectAttribute

Author: Fry

----------------------------------------------------------------------------------------------------------------- */
params["_curator","_added_object"];
sleep (1 + (random 1));
If(_added_object isKindOf "AllVehicles")then
{

  private _grp_arr = [];
  {_grp_arr pushBackUnique (group _x);}forEach (crew _added_object);

  If((count _grp_arr) > 0)then
  {
    private _grp_name = (_grp_arr select 0);

    private _radius = 0;
    private _runpos =  (position _added_object);
    private _parents = [configFile >> "CfgVehicles" >> (typeOf _added_object),true] call BIS_fnc_returnParents;
    private _set_Patrol = switch(true)do
                          {
                            case ("StaticWeapon" in _parents):{0};
                            case ("Tank" in _parents):{If("Artillery" in (getArray(configFile >> "CfgVehicles" >> (typeOf _added_object) >> "availableForSupportTypes")))then{3}else{1};};
                            case ("Car" in _parents):{1};
                            case ("Air" in _parents):{2};
                            case ("Man" in _parents):{0};
                          };

      switch(_set_Patrol)do
      {
        case 0:{
                _grp_name setBehaviour "AWARE";
                _grp_name setCombatMode (selectRandom ["RED","YELLOW","RED","YELLOW","RED","RED","YELLOW","RED","YELLOW","RED"]);
                _grp_name enableAttack true;
                _grp_name enableGunLights "AUTO";
               };
        case 1:{ _radius = (round(random 250));
                If(_radius < 150)then{_radius = 150;};
                [_grp_name,_runpos,_radius] call BFUNC(taskPatrol);
                _grp_name setBehaviour "COMBAT";
                _grp_name setCombatMode (selectRandom ["RED","YELLOW","RED","YELLOW","RED","RED","YELLOW","RED","YELLOW","RED"]);
                _grp_name enableAttack true;
                _grp_name enableGunLights "AUTO";
              };
        case 2:{

                _radius = (round(random 1500));
                If(_radius < 900)then{_radius = 900;};
                [_grp_name,_runpos,_radius] call BFUNC(taskPatrol);
                _grp_name setBehaviour "COMBAT";
                _grp_name setCombatMode "YELLOW";
                _grp_name setSpeedMode "NORMAL";
              };
        default {_added_object setFuel 0;
                 _grp_name setBehaviour "COMBAT";
                 _grp_name setCombatMode (selectRandom ["RED","YELLOW","RED","YELLOW","RED","RED","YELLOW","RED","YELLOW","RED"]);
                };
      };
      [_grp_name] spawn MFUNC(system,setUnitSkill);
    };

};
