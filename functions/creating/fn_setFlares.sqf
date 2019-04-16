If(isMultiplayer)then{if(hasInterface) exitWith{};};
#include "msot_components.hpp"

/* --------------------------------------------------------------------------------------------------------------
Function: MSOT_creating_fnc_setFlares

Description: Creates a maximum counts of 20 Flares (Random)

Parameters:   [POSITION,RADIUS,SCRIPT]

              POSITION  -  ARRAY with Position

              RADIUS    - MAX distance to position

              SCRIPT    - (optional) Script or Code you want to run after Flares creating

Returns: Nothing

Examples:

          _grps = [(getMarkerPos "Town"),150,""] spawn MSOT_creating_fnc_setFlares;

Author: Fry

----------------------------------------------------------------------------------------------------------------- */
private ["_i","_flare_pos","_flare"];
params ["_fl_pos","_fl_radius",["_fl_time",30]["_fl_script",""]];
If(isClass(configfile >> "CfgMods" >> "ace"))then
{
  private _flares_num = (round(random 20));
  If(_flares_num < 10)then{_flares_num = 10;};
  F_LOOP(_i,1,_flares_num)
  {
    _flare_pos = _fl_pos getPos [(round(random _fl_radius)),(random 360)];
    _flare = "ACE_40mm_Flare_white" createVehicle [(_flare_pos # 0),(_flare_pos # 1),((_flare_pos # 2) + 200)];
    _timer = (round(random _fl_time));
    If(_timer < 15)then{_timer = 15};
    sleep _timer;
  };
  switch(typeName _fl_script)do
  {
    case "CODE":{[] spawn _fl_script;};
    case "STRING":{
                    If(count _fl_script > 0)then{[] spawn (compile _fl_script);};
                  };
  };
}else{hint "FAILURE: ACE MOD REQUIRED!";};
true
