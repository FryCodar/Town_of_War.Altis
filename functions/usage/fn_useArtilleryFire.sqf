#include "msot_components.hpp"
/* -----------------------------------------------------------------------------------------------
Function: MSOT_usage_fnc_useArtilleryFire

Description: Use available Artillery Units for Artillery Strikes.

Parameters: [VEHICLE,POSITION,AMMOTYPE,NUMBER]

            VEHICLE    -   NAME OF THE UNIT / ARRAY WITH NAME OF UNITS
            POSITION   -   POSTION OF TARGET AREA
            AMMOTYPE   -   CLASSNAME OF AMMOTYPE
            NUMBER     -   NUMBER OF ROUNDS PER UNIT

Returns: Nothing

Examples:
          [Ari1,(getMarkerPos "Target"),"8Rnd_82mm_Mo_shells", 3] MSOT_usage_fnc_useArtilleryFire;
          [[Ari1,Ari2,Ari3],(getMarkerPos "Target"),"8Rnd_82mm_Mo_shells", 3] MSOT_usage_fnc_useArtilleryFire;

Author: Fry

-------------------------------------------------------------------------------------------------- */

params ["_units","_pos","_ammo_type","_num"];

switch(typeName _units)do
{
  case "OBJECT":{
                  If(alive _units && {!(isNull (gunner _units))} && {!(_unit getVariable [STRVAR_DO(vehicle_service_inuse),false])})then
                  {
                    _units doArtilleryFire [_pos,_ammo_type,_num];
                  };
                };
  case "ARRAY":{
                 {
                   If(alive _x && {!(isNull (gunner _x))} && {!(_x getVariable [STRVAR_DO(vehicle_service_inuse),false])})then
                   {
                     _x doArtilleryFire [_pos,_ammo_type,_num];
                   };
                 }forEach _units
               };
};
