If(!hasInterface) exitWith {};
#include "msot_components.hpp"
private ["_cam","_segment_time","_is_night","_first_point","_second_point"];
_first_point = [];
_second_point = (getPosASL player);

_is_night = If(sunOrMoon <= 0.4)then{true}else{false};

_segment_time = round(MSOT_INTRO_TIME * 0.5);

_cam = "camera" camCreate [0,0,0];
_cam cameraeffect ["internal", "back"];
showcinemaborder false;
If(_is_night)then{camUseNVG true;};

If(count MSOT_CAM_START_MARKER > 0)then{_first_point = (getMarkerPos MSOT_CAM_START_MARKER);}else{_first_point = player getPos [MSOT_CAM_DISTANCE,(random 360)];};

If(count _first_point > 0)then
{
_cam camPrepareTarget player;
_cam camPreparePos [(_first_point select 0),(_first_point select 1),((_first_point select 2) + MSOT_CAM_HEIGHT_START)];
_cam camPrepareFov 0.1;
_cam camCommitPrepared 0;

_cam camPrepareTarget player;
_cam camPreparePos [(_second_point select 0),(_second_point select 1),((_second_point select 2) + MSOT_CAM_HEIGHT_PLAYER_END)];
_cam camPrepareFov 0.1;
_cam camCommitPrepared MSOT_INTRO_TIME;

sleep MSOT_INTRO_TIME;

cutText ["","BLACK FADED",1];
sleep 2;
player cameraEffect ["terminate","back"];
camDestroy _cam;
camera_run = true;
cutText ["","BLACK IN",2];
};
true
