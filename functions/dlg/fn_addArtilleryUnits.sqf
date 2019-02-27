If(isMultiplayer)then{If(!isServer)exitWith{};};
#include "msot_components.hpp"
private ["_holder","_ari_support"];
_holder = missionNameSpace getVariable [STRVAR_DO(artillery_resources),[]];
If(count _holder > 0)then
{
  {
    _ari_support = getArray(configFile >> "CfgVehicles" >> (typeOf _x) >> "availableForSupportTypes");
    If(!(_x in _holder) && {count _ari_support > 0} && {(_ari_support select 0) isEqualTo "Artillery"})then{ARR_ADDVAR(_holder,_x);};
  }forEach _this;
}else{
  {
    private _ari_support = getArray(configFile >> "CfgVehicles" >> (typeOf _x) >> "availableForSupportTypes");
    If(count _ari_support > 0 && {(_ari_support select 0) isEqualTo "Artillery"})then{ARR_ADDVAR(_holder,_x);};
  }forEach _this;
};
If(count _holder > 0)then{missionNameSpace setVariable [STRVAR_DO(artillery_resources),_holder,true];};
