If(!hasInterface) exitWith {};
#include "msot_components.hpp"
#include "msot_template_settings.sqf"
//************************************************************************************************************************************************
//Dont Touch this
["id_start_intro","onPreloadFinished",{["id_start_intro","onPreloadFinished"] call BIS_fnc_removeStackedEventHandler;
                                       diag_log "INITPLAYERLOCAL: Starte INTRO";
                                      [] spawn MFUNC(intout,playintro);}] call BIS_fnc_addStackedEventHandler;
//____________________________________________________________

sleep 3;
//waitUntil{!isNil "camera_run"};
[] call MFUNC(setting,initPlayer);
