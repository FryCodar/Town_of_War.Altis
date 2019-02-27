If(!hasInterface) exitWith {};
#include "msot_components.hpp"

params ["_idx","_vec",["_ammo_sel",0],["_ammo_num",0]];

private _holder = _vec getVariable [STRVAR_DO(artillery_availammo),[]];

If(count _holder > 0)then
{
  switch(toUpper _idx)do
  {
    case "RELOAD":{
                    private _filled = [(call compile (_holder select 1)),(_holder select 1)];
                    _vec setVariable [STRVAR_DO(artillery_availammo),_filled,true];
                  };
    case "UPDATE":{
                    private _filled1 = (_holder select 0);
                    private _new_ammo = If((_filled1 select _ammo_sel) >= _ammo_num)then{(_filled1 select _ammo_sel) - _ammo_num};
                    _filled1 set [_ammo_sel,_new_ammo];
                    _vec setVariable [STRVAR_DO(artillery_availammo),[_filled1,(_holder select 1)],true];
                  };
  };
};
true
