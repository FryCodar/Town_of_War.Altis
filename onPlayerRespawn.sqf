If(isMultiplayer)then{if(!hasInterface) exitWith{};};
#include "msot_components.hpp"

If((["debug_modus",1] call BIS_fnc_getParamValue) == 1 || MSOT_DEBUG_MODE)then
{
  [] call MFUNC(debug,initdebug);
};
