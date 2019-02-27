If(isMultiplayer)then{If(!isServer)exitWith{};};
#include "..\msot_macros.hpp"
/* --------------------------------------------------------------------------------------------------------------
Function: MSOT_usage_fnc_deleteAllInArea

Description:  delete Objects in a defined Area
Parameters: [POSITION,RADIUS]

            POSITION    -   ARRAY with Coordinates
            RADIUS      -   RADIUS arround the POSITION

Returns: Nothing

Examples:
            [(getMarkerPos "Town"),200] call MSOT_usage_fnc_deleteAllInArea

Author: Fry

----------------------------------------------------------------------------------------------------------------- */

params ["_pos","_radius"];
private _all_s_obj = allSimpleObjects [];
private _simpleObjects = _all_s_obj select {_x distance _pos <= _radius};
If(count _simpleObjects > 0)then
{
  {deleteVehicle _x}forEach (nearestObjects [_pos, ["all"],_radius]) + _simpleObjects;
}else{{deleteVehicle _x}forEach (nearestObjects [_pos, ["all"],_radius]);};
