#include "msot_components.hpp"
//this in every Mission
//**************************************************************************************************************************************************
waitUntil{!isNil "bis_fnc_init"};
[] spawn {
            private _st_timer = (time + 10);
            waitUntil{!isNil "MSOT_DEBUG_MODE" || {time > _st_timer}};
            If(isNil "MSOT_DEBUG_MODE")then{MSOT_DEBUG_MODE = false;};
            DEBUG_MODE = If(((["debug_modus",1] call BIS_fnc_getParamValue) isEqualTo 1) || MSOT_DEBUG_MODE)then{true}else{false};
         };
FRY_INIT = false;

If(!hasInterface)then{FRY_INIT = true;}else{If(isNull player)then{[] spawn {waitUntil {!isNull player && player == player}; FRY_INIT = true;};}else{FRY_INIT = true;};};
waitUntil {FRY_INIT};

diag_log "INIT BEGINNT";

enableSentences false;
//***************************************************************************************************************************************************
If(isServer)then
{
  [[H2,H3,H4,H5,H6],120] call MFUNC(usage,addRespawnVecs);
  //[F1] call MFUNC(dlg,addArtilleryUnits);
  //missionNameSpace setVariable [STRVAR_DO(available_artillery),true,true];
  execVM "Engima\enigma_init.sqf";
};
If(hasInterface)then
{
	//setViewDistance 5000;
	player disableConversation true;
};

enableSaving [ false, false ];


init_run = true;
diag_log format ["INIT IST DURCHGELAUFEN: %1",init_run];
