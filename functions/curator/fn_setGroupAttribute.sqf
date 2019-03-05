#include "msot_components.hpp"
/* --------------------------------------------------------------------------------------------------------------
Function: MSOT_curator_fnc_setGroupAttribute

Description: Set attributes to Group (Skill / Ownership)

Parameters:

Returns: Nothing

Examples:
            MSOT_curator_fnc_setGroupAttribute

Author: Fry

----------------------------------------------------------------------------------------------------------------- */
params["_curator","_added_group"];
sleep (1 + (random 1));
private _owner_id = clientOwner;
If((groupOwner _added_group) isEqualTo _owner_id)then{

private _leader = (leader _added_group);
private _runpos = position _leader;

If(count (units _added_group) > 1)then
{
  _radius = (round(random 250));
  If(_radius < 150)then{_radius = 150;};
  [_added_group,_runpos,_radius] call BFUNC(taskPatrol);
  _added_group enableAttack true;
  _added_group enableGunLights "AUTO";
};
_added_group setBehaviour "COMBAT";
_added_group setCombatMode (selectRandom ["RED","YELLOW","RED","YELLOW","RED","RED","YELLOW","RED","YELLOW","RED"]);


[_added_group] spawn MFUNC(system,setUnitSkill);
};
