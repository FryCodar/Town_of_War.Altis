If(isMultiplayer)then{if(hasInterface) exitWith{};};
#include "msot_components.hpp"

/* --------------------------------------------------------------------------------------------------------------
Function: MSOT_system_fnc_workOffMisHolder

Description: Work Off the filled Holder for MissionCheckSystem

Examples:
            [] spawn MSOT_system_fnc_workOffMisHolder

Author: Fry

----------------------------------------------------------------------------------------------------------------- */
private ["_in_store","_in_holder","_handle"];

missionNamespace setVariable [STRVAR_DO(manage_delete_missinfo),true,false];

_in_store = MANAGE_MISSION_HOLDER;
MANAGE_MISSION_HOLDER = [];

While{count _in_store > 0}do
{
  switch(true)do
  {
    case (missionNamespace getVariable [STRVAR_DO(write_to_missinfo),false]):{waitUntil{!(missionNamespace getVariable [STRVAR_DO(write_to_missinfo),false])};};
    case (missionNamespace getVariable [STRVAR_DO(delete_from_missinfo),false]):{waitUntil{!(missionNamespace getVariable [STRVAR_DO(delete_from_missinfo),false])};};
  };
  _in_holder = (_in_store select 0);
  _handle = _in_holder spawn MFUNC(system,doMissionCheck);
  waitUntil{scriptDone _handle};
  _in_store deleteAt 0;
  sleep 1;
  If(count MANAGE_MISSION_HOLDER > 0)then
  {
    If(missionNamespace getVariable [STRVAR_DO(write_to_manager),false])then
    {waitUntil{!(missionNamespace getVariable [STRVAR_DO(write_to_manager),false])};};
    ARR_ADDARR(_in_store,MANAGE_MISSION_HOLDER);
    MANAGE_MISSION_HOLDER = [];
  };
};
missionNamespace setVariable [STRVAR_DO(manage_delete_missinfo),false,false];
