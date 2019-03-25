If(isMultiplayer)then{if(hasInterface) exitWith{};};
#include "msot_components.hpp"
/* --------------------------------------------------------------------------------------------------------------
Function: MSOT_acm_fnc_getEnemyInZone

Description: Find Units of a Side in a specific area.

Parameters: [POSITION,RADIUS,SIDE,(optional BOOL)]

            POSITION    -  Array with Coordinates
            RADIUS      -  Search radius for enemy units
            SIDE        -  Side
            BOOL        -  (optional for List all found Units) default: false

Returns:  NUMBER - of found Units (Men)
          ARRAY  - List of found Units (Men)

Examples:
            _isStored = [(getMarkerPos "Town"),200,EAST] call MSOT_acm_fnc_getEnemyInZone;

Author: Fry

----------------------------------------------------------------------------------------------------------------- */
params ["_search_pos","_search_radius","_search_side",["_list_it",false]];

private _output = If(_list_it)then
                  {
                    (nearestObjects [_search_pos, ["Man"], _search_radius]) select {(side _x isEqualTo _search_side) && alive _x};
                  }else{count ((nearestObjects [_search_pos, ["Man"], _search_radius]) select {(side _x isEqualTo _search_side) && alive _x});};
_output
