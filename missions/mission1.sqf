If(isMultiplayer)then{If(!isServer)exitWith{};};
#include "..\msot_macros.hpp"

private ["_main_pos","_main_radius","_script","_triggername","_force_calc","_i","_marker_city"];
params ["_idx"];


switch(_idx)do
{
  case 0:{
            private _box_pos = (position AMMO_BOX);
            _script = {[1] execVM "missions\mission1.sqf";};
            _triggername = ["ACTIVATE",_box_pos,5] call MFUNC(system,setTrigger);
            ["MAINTRIGGER",_box_pos,[_triggername,_script,0,true]] call MFUNC(system,addMissionInfos);
         };
  case 1:{
            MSOT_MISSION1_POS = [[4213.39,15048.5,0],200];
            MSOT_GENERATORS = [];
            _script = {[2] execVM "missions\mission1.sqf";};
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
            If((random 1) > 0.5)then
            {
              _force_calc = [([] call MFUNC(system,getPlayerCount)),([] call MFUNC(usage,checkNight))] call MFUNC(system,getForcesCalc);
              [(MSOT_MISSION1_POS select 0),(MSOT_MISSION1_POS select 1),(_force_calc select 0),(_force_calc select 1),"MIXED_ALL","MIXED"] call MFUNC(creating,setUnits);
              _script = {[(_this select 1)] call MFUNC(system,setTargetBehavior);sleep 1;};
              _triggername = ["DETECTED",(MSOT_MISSION1_POS select 0),((MSOT_MISSION1_POS select 1) + 200)] call MFUNC(system,setTrigger);
              ["MAINTRIGGER",(MSOT_MISSION1_POS select 0),[_triggername,_script,0,false]] call MFUNC(system,addMissionInfos);
            };
              _script = {[[MSOT_GENERATORS,"GenSound",4,(MSOT_MISSION1_POS select 1)],"scripts\playSound.sqf"] remoteExec ["execVM",([0,-2] select isDedicated)];};
              _triggername = ["ACTIVATE",(MSOT_MISSION1_POS select 0),(MSOT_MISSION1_POS select 1)] call MFUNC(system,setTrigger);
              ["MAINTRIGGER",(MSOT_MISSION1_POS select 0),[_triggername,_script,0,false]] call MFUNC(system,addMissionInfos);


         };
  case 2:{
            [[[3239.96,14000,0],1500],"scripts\switchLights.sqf"] remoteExec ["execVM",0];
            [0,"SUCCEEDED"] call MFUNC(tasks,setTask);
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
                     
         };
  case 3:{


         };
};

/*
Lampenpositionen nach ausschalten des Lichts
[
    [[3170.83,13118.1,0.0659943],182.111],
    [[3193.66,13124.2,0.0605545],0],
    [[3180.03,13168.4,0.00737381],98.2844],
    [[3106.28,13177.2,0.000793457],252.834],
    [[3162.63,13188.6,0.00548553],3.2601],
    [[3071.54,13163.3,0.0460472],244.067]
  ]
*/
