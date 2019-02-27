If(isMultiplayer)then{If(!isServer)exitWith{};};
#include "msot_components.hpp"

/* --------------------------------------------------------------------------------------------------------------
Function: MSOT_system_fnc_manageMissionCheck

Description: manage Requests to MissionCheck

Examples:
            [] spawn MSOT_system_fnc_manageMissionCheck

Author: Fry

----------------------------------------------------------------------------------------------------------------- */

If(isNil "MANAGE_MISSION_HOLDER")then{MANAGE_MISSION_HOLDER = [];};
private _check_arr = _this;
sleep (random 2);
missionNamespace setVariable [STRVAR_DO(write_to_manager),true,false];
ARR_ADDVAR(MANAGE_MISSION_HOLDER,_check_arr);
missionNamespace setVariable [STRVAR_DO(write_to_manager),false,false];

If(!(missionNamespace getVariable [STRVAR_DO(manage_delete_missinfo),false]))then
{
  [] spawn MFUNC(system,workOffMisHolder);
};
