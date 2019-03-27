if(!hasInterface) exitwith {};
#include "msot_components.hpp"

params ["_obj","_caller","_idx","_xtra"];


  switch(_xtra)do
  {
   case 0:{
            createDialog "MSOT_TRAVEL_TABLE";
   	      };
   case 1:{
            private _pos = (position _caller);
            private _posatl = (getPosATL _caller);
            private _posasl = (getPosASL _caller);
            private _dir = (getDir _caller);
            hint format ["SPIELER DATEN:\n\nPOSITION: %1\nPOSITION_ATL: %2\nPOSITION_ASL: %3\nDIR: %4",_pos,_posatl,_posasl,_dir];
  		      diag_log format ["SPIELER DATEN:____POSITION: %1 ____POSITION_ATL: %2 ____POSITION_ASL: %3 ____DIR: %4",_pos,_posatl,_posasl,_dir];
            copyToClipboard format ["[SPIELER DATEN: >>> POSITION_NORMAL: %1 <<<_>>> POSITION_ATL: %2 <<<_>>> POSITION_ASL: %3 <<<_>>> DIR: %4 <<<]",_pos,_posatl,_posasl,_dir];
          };
   case 2:{
            // ERSTER TESTBEREICH
            hint "Script 1 begins";
            //_____________________________________________________________________________________________________________________________
           //  _modules = [Car1,true] call MSOT_creating_fnc_setFSeffect;
           //_datas = [] call MSOT_acm_fnc_getPlayerZone;
           //hint str _datas;
           //copyToClipboard str _datas;
           //_marker_name = [((missionNamespace getVariable [STRVAR_DO(acm_main_pos),[]]) select 0),"Tester","ELLIPSE",[1000,1000]] call MSOT_usage_fnc_setMapMarker;
           hint str ([(position player),200,MSOT_ENEMY_SIDE] call MFUNC(acm,getEnemyInZone));
          };
   case 3:{
            //ZWEITER TESTBEREICH
            hint "Script 2 begins";
            //"F_40mm_White","Flare_82mm_AMOS_White","ACE_40mm_Flare_white"
            _posit = (position player);

            _flare_num = (round(random 20));
            If(_flare_num < 10)then{_flare_num = 10;};
            hint str _flare_num;
            sleep 2;
            F_LOOP(_i,1,_flare_num)
            {
              _flare_pos = _posit getPos [(round(random 200)),(random 360)];
              _flare = "ACE_40mm_Flare_white" createVehicle [(_flare_pos # 0),(_flare_pos # 1),((_flare_pos # 2) + 200)];
              _timer = (random 30);
              hint str _timer;
              If(_timer < 15)then{_timer = 15;};
              sleep _timer;
            };

          };
   case 4:{
            If(captive player)then
            {
              player setCaptive false;
              hint format ["Friendly: %1",(captive player)];
            }else{
                  player setCaptive true;
                  hint format ["Friendly: %1",(captive player)];
                };
  		    };

  };

/*
IDSEH = player addEventHandler ["InventoryOpened",{[[0],"Missions\mission_1.sqf"] remoteExec ["execVM", 0]; player removeEventHandler ["InventoryOpened",IDSEH];}];
PFEIL Blau = "Sign_Arrow_Blue_F"
              Sign_Arrow_F
moves = ["aidlpsitmstpsnonwnondnon_ground00"];

rosa = #ff45f0
gelb = #dddd00
hellblau = #f000ffff
grün = #f000ff00
rot = #ff1221
	#f00dffff
[Terminal,0] call BIS_fnc_dataTerminalAnimate; Terminal aufklappen 0 = zu 3 = auf

private _arr = [];
private _main_arr = [];
private _nums = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,
                 21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,
                 41,42,43,44,45,46,47,48,49];

private _s_nums = [1,2,3,4,5,6,7,8,9,0];

While{count _arr < 6}do
{
  _arr pushBackUnique (selectRandom _nums);
  sleep 1;
};
_main_arr pushBack _arr;
_main_arr pushBack (selectRandom _s_nums);
hint str _main_arr;
copyToClipboard str _main_arr;



*/
