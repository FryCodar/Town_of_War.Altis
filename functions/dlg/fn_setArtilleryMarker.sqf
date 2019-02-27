If(!hasInterface) exitWith {};
#include "msot_components.hpp"
private ["_sidx","_world_pos","_markername","_m_control"];
params ["_idx",["_control",0],["_x_koordinate",0],["_y_koordinate",0]];
disableSerialization;

_sidx = If(count (missionNamespace getVariable [STRVAR_DO(artillery_marker),""]) < 1 && {_idx <= 1})then{0}else{_idx};

switch(_sidx)do
{
  case 0:{
           _world_pos = _control ctrlMapScreenToWorld [_x_koordinate,_y_koordinate];
            If(isMultiplayer)then
            {
              _markername = createMarkerLocal [(format["artillery_%1",(name player)]),[(_world_pos select 0),(_world_pos select 1)]];
              _markername setMarkerShapeLocal "ICON";
              _markername setMarkerTypeLocal "mil_destroy";
              _markername setMarkerColorLocal "ColorRed";
            }else{
                  _markername = createMarker [(format["artillery_%1",(name player)]),[(_world_pos select 0),(_world_pos select 1)]];
                  _markername setMarkerShape "ICON";
                  _markername setMarkerType "mil_destroy";
                  _markername setMarkerColor "ColorRed";
                };

            ctrlSetText [10029, "Target area selected!"];
            missionNamespace setVariable [STRVAR_DO(artillery_marker),_markername,false];

         };
  case 1:{
            _world_pos = _control ctrlMapScreenToWorld [_x_koordinate,_y_koordinate];
            If(isMultiplayer)then
            {
              (missionNamespace getVariable [STRVAR_DO(artillery_marker),""]) setMarkerPosLocal [(_world_pos select 0),(_world_pos select 1)];
            }else{
                   (missionNamespace getVariable [STRVAR_DO(artillery_marker),""]) setMarkerPos [(_world_pos select 0),(_world_pos select 1)];
                 };
            _m_control = ((findDisplay 36643) displayCtrl 10039);
            If(_m_control ctrlChecked 0)then{_m_control ctrlSetChecked [0, false]; ctrlEnable [10040, false];};
            ctrlSetText [10029, "Target area changed!"];
         };
  case 2:{
           If(count (missionNamespace getVariable [STRVAR_DO(artillery_marker),""]) > 0)then
           {
            If(isMultiplayer)then
            {
              deleteMarkerLocal (missionNamespace getVariable [STRVAR_DO(artillery_marker),""]);
              missionNamespace setVariable [STRVAR_DO(artillery_marker),"",false];
            }else{
                   deleteMarker (missionNamespace getVariable [STRVAR_DO(artillery_marker),""]);
                   missionNamespace setVariable [STRVAR_DO(artillery_marker),"",false];
                 };
           };
         };
};
