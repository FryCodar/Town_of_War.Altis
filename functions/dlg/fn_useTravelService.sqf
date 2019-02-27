If(!hasInterface) exitWith {};
#include "msot_components.hpp"
params ["_idx"];


switch(_idx)do
{
  case 0:{
            {ctrlEnable [_x, false];}forEach [10044,10045,10047,10046];
            sliderSetRange [10047, 5, 100];
            sliderSetSpeed [10047, 1,10];
         };
  case 1:{
            {If(!(ctrlEnabled _x))then{ctrlEnable [_x, true];};}forEach [10044,10045];
            {If(ctrlEnabled _x)then{ctrlEnable [_x, false];};}forEach [10047,10046];
            ctrlSetText [10043, "Choose a travel method!"];
         };
  case 2:{
            If(!(ctrlEnabled 10046))then{ctrlEnable [10046, true];};
            If(ctrlEnabled 10047)then{ctrlEnable [10047, false];};
            missionNameSpace setVariable [STRVAR_DO(travel_idx),0,false];
            ctrlSetText [10043, "Normal Travel selected!"];
         };
  case 3:{
           {If(!(ctrlEnabled _x))then{ctrlEnable [_x, true];};}forEach [10047,10046];
           missionNameSpace setVariable [STRVAR_DO(travel_idx),1,false];
           ctrlSetText [10043, "HALO Jump selected!"];
         };
  case 4:{
            ctrlSetText [10048,(format ["%1 m",(round((round(sliderPosition 10047)) * 100))])];
         };
  case 5:{
            private _index = missionNamespace getVariable STRVAR_DO(travel_idx);
            private _travel_marker = getMarkerPos (missionNamespace getVariable STRVAR_DO(artillery_marker));
            private _height = (call compile(((ctrlText 10048) splitString " ") select 0));
            [_index,_travel_marker,_height] spawn MFUNC(dlg,doTravel);
            closeDialog ((uiNamespace getVariable ['msot_dlg',[]]) select 0);
         };
};
