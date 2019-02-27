If(!hasInterface) exitWith {};
#include "msot_components.hpp"

params ["_name","_list"];

private _output = [];
private _spl_arr = _name splitString " ";
If(count _spl_arr > 0)then
{
 private _unit = (_list select ((call compile (_spl_arr select ((count _spl_arr) - 1))) - 1));
 _output = [(typeOf _unit),_unit];
};
_output
