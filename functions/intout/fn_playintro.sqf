If(!hasInterface) exitWith {};
#include "msot_components.hpp"



private ["_segmented_time","_hour","_minute","_missionName","_stringed_minute","_intro_datas"];
If(((["play_intro_music",1] call BIS_fnc_getParamValue) isEqualTo 1) && MSOT_PLAY_INTRO_MUSIC)then{playMusic "EventTrack01_F_EPA";};
_stringed_minute = "";
_hour = floor daytime;
_minute = floor ((daytime - _hour) * 60);
If(_minute < 10)then{_stringed_minute = format["0%1",_minute];}else{_stringed_minute = format["%1",_minute]};
If(((["play_intro", 1] call BFUNC(getParamValue)) isEqualTo 1) && MSOT_PLAY_INTRO_WITH_CAM)then
{
  _segmented_time = round(MSOT_INTRO_TIME * 0.5);
  cutText ["","BLACK",0.001];
  sleep 2;
  [] spawn MFUNC(intout,runcamera);
  cutText ["","BLACK IN",2];
  sleep _segmented_time;
};

sleep 2;
If(MSOT_PLAY_INTRO_WITH_LOGO)then
{
  _missionName = getMissionConfigValue ["onLoadName", "NAME NOT FOUND"];
  _text = format ["<img size= '10' style='vertical-align:middle' shadow='true' image='pics\MSOT.paa'/><br/><t size='.9' color='#FFFFFF'>%1</t>", _missionName];
  [_text,0,0,2,2] spawn BFUNC(dynamicText);
};
[str(date select 2) + "." + str(date select 1) + "." + str(date select 0), str(_hour) + ":" + _stringed_minute,worldName] spawn BIS_fnc_infoText;
camera_run = true;

true
