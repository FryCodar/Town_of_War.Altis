If(isMultiplayer)then{If(!isServer)exitWith{};};
#include "..\msot_macros.hpp"

private ["_main_pos","_main_radius","_script","_triggername","_force_calc","_i","_marker_city","_air_pos","_co","_air_vec","_air_grp"];
params ["_idx"];


switch(_idx)do
{
  case 0:{
            private _box_pos = (position AMMO_BOX);
            _script = {[1] execVM "missions\mission1.sqf";};
            _triggername = ["ACTIVATE",_box_pos,5] call MFUNC(system,setTrigger);
            ["MAINTRIGGER",_box_pos,[_triggername,_script,0,false]] call MFUNC(system,addMissionInfos);
            _script = { "AmbientTrack04a_F" remoteExec ["playMusic",([0,-2] select isDedicated)];};
            _triggername = ["LEAVE",_box_pos,100] call MFUNC(system,setTrigger);
            ["MAINTRIGGER",_box_pos,[_triggername,_script,0,true]] call MFUNC(system,addMissionInfos);
         };
  case 1:{

            MSOT_MISSION1_POS = [[4213.39,15048.5,0],200];
            MSOT_GENERATORS = [];

            //erstelle Luftabwehr------------------------------------------------------------------------------------------------------------------
            //Luftabwehr [[3590.73,13608.5,0],500]
            MSOT_ANTI_AIRS = [];
            If(count MSOT_ANTIAIR > 0)then
            {
              private _anti_air_pos = [];
              private _air_class = (selectRandom MSOT_ANTIAIR);
              F_LOOP(_i,0,2)
              {
                _air_pos = [[3590.73,13608.5,0],500,15] call MFUNC(geometry,getCirclePos);
                If(count _anti_air_pos > 0)then
                {
                   _co = 0;
                   while{({(_air_pos distance _x) < 150} count _anti_air_pos) > 1 && _co <= 100}do
                   {
                    _air_pos = [[3590.73,13608.5,0],500,15] call MFUNC(geometry,getCirclePos);
                    _co = _co + 1;
                    sleep 0.04;
                   };
                };
                ARR_ADDVAR(_anti_air_pos,_air_pos);
                _air_grp = CREA_GROUP(MSOT_ENEMY_SIDE);
                _air_vec = [_air_pos,(random 360),_air_class,_air_grp] call BFUNC(spawnVehicle);
                (_air_vec # 0) setFuel 0;
                [(_air_vec select 2)] call MFUNC(system,setUnitSkill);
                (_air_vec select 2) setBehaviour "COMBAT";
      	        (_air_vec select 2) setCombatMode "RED";
                MSOT_ANTI_AIRS pushBack (_air_vec # 0);
               sleep 0.04;
              };
            };
            sleep 1;
            //--------------------------------------------------------------------------------------------------------------------------------------
            //Platziere Waffenkiste
            MSOT_WEAPONS_BASE_DATAS = [];
            private _weapons_pos = [[3681.17,13292,0],200,20] call MFUNC(geometry,getCirclePos);
            If(count _weapons_pos > 0)then
            {
              ARR_ADDVAR(MSOT_WEAPONS_BASE_DATAS,_weapons_pos);
              private _weapon_base = [2,_weapons_pos,(random 360)] call MSOT_creating_fnc_setBase;
              {_x allowDamage false;}forEach (_weapon_base # 0);
              ARR_ADDVAR(MSOT_WEAPONS_BASE_DATAS,(_weapon_base # 0));
              private _ammo_box = ((_weapon_base # 1) # 0);
              ARR_ADDVAR(MSOT_WEAPONS_BASE_DATAS,_ammo_box);
              [_ammo_box,"AMMO","RED","OPEN ARSENAL"] remoteExec [STR_MFUNC(system,setClientAction),([0,-2] select isDedicated),true];
            };
            sleep 1;
            //--------------------------------------------------------------------------------------------------------------------------------------
            //Platziere Funkturm
            MSOT_RADIO_TOWER = [];
            private _radio_pos = selectRandom [[3361.05,13003.6,0],[3291.73,12957.7,0],[3277.32,13007.3,0],[3184.83,12908.1,0],
                                               [3123.59,12972.1,0],[3395.06,13124.2,0],[3268.48,13179.5,0],[3254.63,13036.6,0]];

            ARR_ADDVAR(MSOT_RADIO_TOWER,_radio_pos);
            private _radio_tower = "Land_TTowerBig_2_F" createVehicle _radio_pos;
            _radio_tower setDir (random 360);
            _radio_tower allowDamage false;
            ARR_ADDVAR(MSOT_RADIO_TOWER,_radio_tower);


            //--------------------------------------------------------------------------------------------------------------------------------------
            sleep 1;

            _script = {[3] execVM "missions\mission1.sqf";};
            {
              private _gen = "Land_dp_transformer_F" createVehicle (_x # 0);
              _gen setDir (_x # 1);
              ARR_ADDVAR(MSOT_GENERATORS,_gen);
              [_gen,"SUCCESS"] call MFUNC(system,addKilledEvent);
              ["MAINTARGETS",(MSOT_MISSION1_POS select 0),[_gen,"",""]] call MSOT_system_fnc_addMissionInfos;
            }forEach [[[4208.97,15011.7,0.00139427],0],[[4198.7,15011.5,0.001297],0]];
            _marker_city = [(MSOT_MISSION1_POS select 0),"GENMARKER","ELLIPSE",[(MSOT_MISSION1_POS select 1),(MSOT_MISSION1_POS select 1)]] call MFUNC(usage,setMapMarker);
            ["MAINMARKER",(MSOT_MISSION1_POS select 0),[_marker_city,_script]] spawn MSOT_system_fnc_addMissionInfos;
            [0,"AUTOASSIGNED",(MSOT_MISSION1_POS select 0)] call MFUNC(tasks,setTask);
              _force_calc = [([] call MFUNC(system,getPlayerCount)),([] call MFUNC(usage,checkNight))] call MFUNC(system,getForcesCalc);
              [(MSOT_MISSION1_POS select 0),(MSOT_MISSION1_POS select 1),(_force_calc select 0),(_force_calc select 1),"MIXED_ALL","MIXED"] call MFUNC(creating,setUnits);
              _script = {
                         [(_this select 1)] call MFUNC(system,setTargetBehavior);sleep 1;
                         If((random 1) > 0.5)then{[(MSOT_MISSION1_POS select 0),1100,["CAR","TRUCK"],"PATROL"] call MSOT_creating_fnc_setConvoy;};
                        };
              _triggername = ["DETECTED",(MSOT_MISSION1_POS select 0),((MSOT_MISSION1_POS select 1) + 200)] call MFUNC(system,setTrigger);
              ["MAINTRIGGER",(MSOT_MISSION1_POS select 0),[_triggername,_script,0,false]] call MFUNC(system,addMissionInfos);
              _script = {
                          [[MSOT_GENERATORS,"GenSound",4,(MSOT_MISSION1_POS select 1)],"scripts\playSound.sqf"] remoteExec ["execVM",([0,-2] select isDedicated)];
                          [2] execVM "missions\mission1.sqf";
                        };
              _triggername = ["ACTIVATE",(MSOT_MISSION1_POS select 0),(MSOT_MISSION1_POS select 1)] call MFUNC(system,setTrigger);
              ["MAINTRIGGER",(MSOT_MISSION1_POS select 0),[_triggername,_script,0,false]] call MFUNC(system,addMissionInfos);


         };
  case 2:{
            //MainBase [[3089.29,13173,0],130]
            //Luftabwehr [[3590.73,13608.5,0],500]
            //MainBase Soldiers______________________________________________________________________________________________________
            _force_calc = [([] call MFUNC(system,getPlayerCount)),false] call MFUNC(system,getForcesCalc);
            [[3089.29,13173,0],130,(_force_calc select 0),(_force_calc select 1),"MIXED_ALL","MIXED"] call MFUNC(creating,setUnits);

            [[3590.73,13608.5,0],500,((_force_calc select 0) + 2),(_force_calc select 1),"MIXED_ALL","MIXED"] call MFUNC(creating,setUnits);

            If((_force_calc # 2) > 0)then
            {
              [[3590.73,13608.5,0],500 ,((_force_calc # 2) + 1), "CAR","AREA",false] call MFUNC(creating,setVehicles);
              If((random 1) < 0.5)then
              {[[3590.73,13608.5,0],500 ,1,"APC","AREA",false] call MFUNC(creating,setVehicles);
              }else{[[3590.73,13608.5,0],500 ,1,"TANK","AREA",false] call MFUNC(creating,setVehicles);};
            };

         };
  case 3:{
            [[[3239.96,14000,0],1500],"scripts\switchLights.sqf"] remoteExec ["execVM",0];
            [0,"SUCCEEDED"] call MFUNC(tasks,setTask);

            _script = {
                        [(_this select 1)] call MFUNC(system,delFromSystem);
                        [(MSOT_MISSION1_POS select 0),(MSOT_MISSION1_POS select 1)] call MFUNC(usage,deleteAllInArea);
                      };
            _triggername = ["LEAVE",(MSOT_MISSION1_POS select 0),((MSOT_MISSION1_POS select 1) + 200)] call MFUNC(system,setTrigger);
            ["MAINTRIGGER",(MSOT_MISSION1_POS select 0),[_triggername,_script,0,true]] call MFUNC(system,addMissionInfos);

            {
              private _lamp = "Land_PortableLight_double_F" createVehicle (_x # 0);
              _lamp setDir (_x # 1);
            }forEach [
                      [[3170.83,13118.1,0.0659943],182.111],
                      [[3193.66,13124.2,0.0605545],0],
                      [[3180.03,13168.4,0.00737381],98.2844],
                      [[3106.28,13177.2,0.000793457],252.834],
                      [[3162.63,13188.6,0.00548553],3.2601],
                      [[3071.54,13163.3,0.0460472],244.067]
                     ];
            _script = {
                        [(_this select 1)] call MFUNC(system,setTargetBehavior);sleep 1;
                      };
            _triggername = ["DETECTED",[3590.73,13608.5,0],900] call MFUNC(system,setTrigger);
            ["MAINTRIGGER",[3590.73,13608.5,0],[_triggername,_script,0,false]] call MFUNC(system,addMissionInfos);
            sleep 5;
            //Aufgabenzuteilung AA
            If(count MSOT_ANTI_AIRS > 0)then
            {
              {
                private _marker_aa = [(position _x),(str _x),"ICON",[1,1],"ColorGreen","hd_destroy","Solid",0,"AA"] call MFUNC(usage,setMapMarker);
                _script = {(localize "STR_Info_TXT1") remoteExec ["hint",([0,-2] select isDedicated)];};
                [_x,"SUCCESS"] call MFUNC(system,addKilledEvent);
                ["MAINTARGETS",[3590.73,13608.5,0],[_x,_marker_aa,_script]] call MSOT_system_fnc_addMissionInfos;
              }forEach MSOT_ANTI_AIRS;
              _script = {[1,"SUCCEEDED"] call MFUNC(tasks,setTask);};
              ["MAINMARKER",[3590.73,13608.5,0],["",_script]] spawn MSOT_system_fnc_addMissionInfos;
              [1,"AUTOASSIGNED"] call MFUNC(tasks,setTask);
            };
            sleep 5;
            //Aufgabenzuteilung Waffenkiste
            If(count MSOT_WEAPONS_BASE_DATAS > 0)then
            {
              private _weapon_marker = [[3681.17,13292,0],"WEAPMARKER","ELLIPSE",[200,200]] call MFUNC(usage,setMapMarker);
              [(MSOT_WEAPONS_BASE_DATAS # 2),"SUCCESS"] call MFUNC(system,addKilledEvent);
              _script = {
                          [2,"SUCCEEDED"] call MFUNC(tasks,setTask);
                          (localize "STR_Info_TXT2") remoteExec ["hint",([0,-2] select isDedicated)];
                        };
              ["MAINTARGETS",[3681.17,13292,0],[(MSOT_WEAPONS_BASE_DATAS # 2),_weapon_marker,_script]] call MSOT_system_fnc_addMissionInfos;
             _script = {{_x allowDamage true;}forEach (MSOT_WEAPONS_BASE_DATAS # 1);};
             _triggername = ["ACTIVATE",(MSOT_WEAPONS_BASE_DATAS # 0),30] call MFUNC(system,setTrigger);
             ["MAINTRIGGER",(MSOT_WEAPONS_BASE_DATAS # 0),[_triggername,_script,0,true]] call MFUNC(system,addMissionInfos);
             [2,"AUTOASSIGNED",[3681.17,13292,0]] call MFUNC(tasks,setTask);
            };
            sleep 5;
            //Aufgabenzuteilung Funktturm
            private _tower_marker = [(MSOT_RADIO_TOWER # 0),"TOWERMARKER","ICON",[1,1],"ColorRed","hd_destroy","Solid",0,"Radio Tower"] call MFUNC(usage,setMapMarker);
            [(MSOT_RADIO_TOWER # 1),"SUCCESS"] call MFUNC(system,addKilledEvent);
            _script = {
                        [3,"SUCCEEDED"] call MFUNC(tasks,setTask);
                        (localize "STR_Info_TXT3") remoteExec ["hint",([0,-2] select isDedicated)];
                      };
            ["MAINTARGETS",(MSOT_RADIO_TOWER # 0),[(MSOT_RADIO_TOWER # 1),_tower_marker,_script]] call MSOT_system_fnc_addMissionInfos;
            _script = {(MSOT_RADIO_TOWER # 1) allowDamage true;};
            _triggername = ["ACTIVATE",(MSOT_RADIO_TOWER # 0),30] call MFUNC(system,setTrigger);
            ["MAINTRIGGER",(MSOT_RADIO_TOWER # 0),[_triggername,_script,0,true]] call MFUNC(system,addMissionInfos);
            [3,"AUTOASSIGNED",(MSOT_RADIO_TOWER # 0)] call MFUNC(tasks,setTask);

            missionNameSpace setVariable [STRVAR_DO(save_in_system),false,true];
            [4] execVM "missions\mission1.sqf";

         };
  case 4:{
             // Activate Trigger zum Start der Positionsbestimmung
             _script = {
                         [] spawn MFUNC(acm,acmSystem);
                       };
             _triggername = ["ACTIVATE",[3590.73,13608.5,0],450] call MFUNC(system,setTrigger);
             ["MAINTRIGGER",[3590.73,13608.5,0],[_triggername,_script,0,false]] call MFUNC(system,addMissionInfos);
         };
};
