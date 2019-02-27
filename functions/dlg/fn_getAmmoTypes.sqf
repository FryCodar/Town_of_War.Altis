If(!hasInterface) exitWith {};
#include "msot_components.hpp"
params ["_vec",["_get_all_infos",false]];

private _arr = [];

private _config = (configFile >> "CfgVehicles" >> (typeOf _vec) >> "Turrets" >> "MainTurret");
If(_config call BFUNC(getCfgIsClass))then
{
  private _magazines = getArray(_config >> "magazines");
  If(count _magazines > 0)then
  {
    If(_get_all_infos)then
    {
      private _mag_config = (configFile >> "CfgMagazines");
      private _all_magazines = [];private _all_mag_names = [];
      {
        ARR_ADDVAR(_all_magazines,_x);
        private _m_name = getText(_mag_config >> _x >> "displayNameShort");
        If(count _m_name > 0)then{ARR_ADDVAR(_all_mag_names,_m_name);}else{ARR_ADDVAR(_all_mag_names,_x);};
      }forEach _magazines;
      _arr = [_all_magazines,_all_mag_names];
    }else{
            _arr = [[],[]];
         };
    If(count (_vec getVariable [STRVAR_DO(artillery_availammo),[]]) > 0)then
    {
      private _holder = ((_vec getVariable [STRVAR_DO(artillery_availammo),[]]) select 0);
      ARR_ADDVAR(_arr,_holder);
    }else{
           private _ammo_arr = (magazinesAllTurrets _vec) select {(_x select 1) isEqualTo [0]};
           If(count _ammo_arr > 0)then
           {
             private _ammo_count = [];
             {ARR_ADDVAR(_ammo_count,(_x select 2));}forEach _ammo_arr;
             ARR_ADDVAR(_arr,_ammo_count);
             private _str_ammo = format["%1",_ammo_count];
             _vec setVariable [STRVAR_DO(artillery_availammo),[_ammo_count,_str_ammo],true];
           }else{_arr = [[],[],[]];};
         };
  };
};
_arr
