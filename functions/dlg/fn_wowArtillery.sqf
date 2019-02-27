If(!hasInterface) exitWith {};
#include "msot_components.hpp"
private ["_holder","_add_txt","_control","_v_control","_type","_config","_pic","_ammo","_i","_state","_para"];
params ["_idx","_info"];
disableSerialization;
//private _control = ((findDisplay 36643) displayCtrl 10024);
switch(_idx)do
{
  case 0:{  //LOAD LIST
            {ctrlEnable [_x, false];}forEach [10022,10025,10026,10028,10031,10032,10034,10039,10040];
            sleep 0.1;
            If(missionNamespace getVariable[STRVAR_DO(available_artillery),false] && {(count (missionNamespace getVariable[STRVAR_DO(artillery_resources),[]])) > 0})then
            {

              ctrlEnable [10022, true];
              _holder = missionNamespace getVariable[STRVAR_DO(artillery_resources),[]];
              {
               If(alive _x && {!(isNull (gunner _x))})then
               {
                _add_txt = format[(getText(configfile >> "CfgVehicles" >> (typeOf _x) >> "displayName")) + " %1",(_forEachIndex + 1)];
                lbAdd [10024,_add_txt];
                _pic = getText(configfile >> "CfgVehicles" >> (typeOf _x) >> "picture");
                If(count _pic > 0)then{lbSetPicture [10024,((lbSize 10024) - 1), _pic];lbSetPictureColor [10024,((lbSize 10024) - 1), [1, 0, 0, 1]];};
               };
              }forEach _holder;

            }else{ctrlSetText [10029, "No Artillery available!"];};
         };
  case 1:{
            //CONTROL ARTILLERY AVAILABLE LIST
            _control = ((findDisplay 36643) displayCtrl 10024);
            _holder = missionNamespace getVariable[STRVAR_DO(artillery_resources),[]];
            _type = [(lbText [10024, _info]),_holder] call MFUNC(dlg,getUnitTypeName);
            If(count _type > 0)then
            {
              If(count (lbSelection _control) > 1)then
              {
                If(!((_type select 0) isEqualTo MSOT_CHECKARTILLERY_TYPE))then
                {
                  ctrlEnable [10025, false];_control lbSetSelected [_info,false];
                  ctrlSetText [10029, "Select identical Artillery Type please!"];
                }else{If(!(ctrlEnabled 10025))then{ctrlEnable [10025, true];};
                      ctrlSetText [10029, ""];
                     };
              }else{
                      If(lbSize 10028 < 1)then
                      {
                        MSOT_CHECKARTILLERY_TYPE = (_type select 0);
                        ctrlEnable [10025, true];ctrlSetText [10029, ""];
                      }else{
                             If(!((_type select 0) isEqualTo MSOT_CHECKARTILLERY_TYPE))then
                             {
                               ctrlEnable [10025, false];_control lbSetSelected [_info,false];
                               ctrlSetText [10029, "To Add a Vehicle select a identical Artillery Type please!"];
                             }else{If(!(ctrlEnabled 10025))then{ctrlEnable [10025, true];};
                                   ctrlSetText [10029, ""];}
                           };
                     If((!(_control lbIsSelected _info)) && {count (lbSelection _control) < 1})then{ctrlEnable [10025, false];};
                   };
            };
         };
  case 2:{ // CONTROL ADD BUTTON FOR SELECTED ARTILLERY LIST
            If(!(missionNamespace getVariable [STRVAR_DO(artillery_fire_timer),false]))then{ctrlEnable [10028,true];};
            _control = ((findDisplay 36643) displayCtrl 10024);
            _holder = missionNamespace getVariable[STRVAR_DO(artillery_resources),[]];
            While{count (lbSelection _control) > 0}do
            {
              _add_txt = (lbText [10024, ((lbSelection _control) select 0)]);
              _type = [_add_txt,_holder] call MFUNC(dlg,getUnitTypeName);
              If(count _type > 0)then
              {
                lbAdd [10028,_add_txt];
                _pic = getText(configfile >> "CfgVehicles" >> (_type select 0) >> "picture");
                If(count _pic > 0)then{lbSetPicture [10028,((lbSize 10028) - 1), _pic];lbSetPictureColor [10028,((lbSize 10028) - 1), [0, 1, 0, 1]];};
                lbDelete [10024,((lbSelection _control) select 0)];
              };
              sleep 0.04;
            };
            ctrlEnable [10025, false];
         };
  case 3:{ // CONTROL SELECTED ARTILLERY LIST
           _control = ((findDisplay 36643) displayCtrl 10028);
           private _m_control = ((findDisplay 36643) displayCtrl 10039);
           If(_m_control ctrlChecked 0)then{_m_control ctrlSetChecked [0, false]; ctrlEnable [10040, false];};
           If((count (lbSelection _control)) < 1)then
           {
             {ctrlEnable [_x, false];}forEach [10026,10031,10032,10034,10039,10040];
             If(lbSize 10031 > 0)then{lbClear 10031;};
             MSOT_AVAILABLE_AMMOTYPES = [];
             MSOT_RELOAD_ARTILLERY = [];
           }else{ {ctrlEnable [_x, true];}forEach [10026,10031,10034];
                  _holder = missionNamespace getVariable[STRVAR_DO(artillery_resources),[]];
                  switch(true)do
                  {
                    case (count (lbSelection _control) > 0 && {count (lbSelection _control) < 2}):{
                                                                                                    _type = [(lbText [10028, ((lbSelection _control) select 0)]),_holder] call MFUNC(dlg,getUnitTypeName);
                                                                                                    If(count _type > 0)then
                                                                                                    {
                                                                                                      MSOT_RELOAD_ARTILLERY = (_type select 1);
                                                                                                      _ammo = [(_type select 1),true] call MFUNC(dlg,getAmmoTypes);
                                                                                                      If(lbSize 10031 < 1)then
                                                                                                      {
                                                                                                        MSOT_AVAILABLE_AMMOTYPES = (_ammo select 0);
                                                                                                        {lbAdd [10031,_x];}forEach (_ammo select 1);
                                                                                                      };
                                                                                                      {lbSetTooltip [10031,_forEachIndex,format["available Projectiles: %1",_x]];}forEach (_ammo select 2);
                                                                                                      If(!(missionNamespace getVariable [STRVAR_DO(artillery_reload_timer),false]))then
                                                                                                      {
                                                                                                        ctrlEnable [10032, true];
                                                                                                      }else{ctrlEnable [10032,false];};
                                                                                                    };
                                                                                                  };
                    case (count (lbSelection _control) > 1):{
                                                              ctrlEnable [10032,false];
                                                              F_LOOP(_i,0,((lbSize 10031) - 1)){lbSetTooltip [10031,_i,""];};
                                                            };
                  };
                  If((lbCurSel 10031) < 0)then{ctrlSetText [10029, "Select a Artillery Ammo please!"];};
           };
         };
   case 4:{ //CONTROL REMOVE BUTTON
            _control = ((findDisplay 36643) displayCtrl 10028);
            _holder = missionNamespace getVariable[STRVAR_DO(artillery_resources),[]];
            If((count (lbSelection _control)) isEqualTo (lbSize 10028))then
            {
              {
                _add_txt = (lbText [10028,_x]);
                _type = [_add_txt,_holder] call MFUNC(dlg,getUnitTypeName);
                If(count _type > 0)then
                {
                  lbAdd [10024,_add_txt];
                  _pic = getText(configfile >> "CfgVehicles" >> (_type select 0) >> "picture");
                  If(count _pic > 0)then{lbSetPicture [10024,((lbSize 10024) - 1), _pic];lbSetPictureColor [10024,((lbSize 10024) - 1), [1, 0, 0, 1]];};
                };
              }forEach (lbSelection _control);
              lbClear 10028;
            }else{
                   While{count (lbSelection _control) > 0}do
                   {
                     _add_txt = (lbText [10028,((lbSelection _control) select 0)]);
                     _type = [_add_txt,_holder] call MFUNC(dlg,getUnitTypeName);
                     If(count _type > 0)then
                     {
                       lbAdd [10024,_add_txt];
                       _pic = getText(configfile >> "CfgVehicles" >> (_type select 0) >> "picture");
                       If(count _pic > 0)then{lbSetPicture [10024,((lbSize 10024) - 1), _pic];lbSetPictureColor [10024,((lbSize 10024) - 1), [1, 0, 0, 1]];};
                     };
                     lbDelete [10028,((lbSelection _control) select 0)];
                     sleep 0.04;
                   };
                 };
              If((lbSize 10028) < 1)then{[3,0] spawn MFUNC(dlg,wowArtillery);};
          };
   case 5:{ //CONTROL AMMOLIST
            If(!(ctrlEnabled 10039))then{ctrlEnable [10039,true];};
            _control = ((findDisplay 36643) displayCtrl 10039);
            _v_control = ((findDisplay 36643) displayCtrl 10039);
            If(_control ctrlChecked 0)then{_control ctrlSetChecked [0, false]; ctrlEnable [10040, false];};
            If(_info > -1)then
            {
              If(!(ctrlEnabled 10039))then{ctrlEnable [10039,true];};
              MSOT_SELECTED_AMMOTYPE = (MSOT_AVAILABLE_AMMOTYPES select _info);
              MSOT_SELECTED_AMMOINDEX = _info;
            }else{MSOT_SELECTED_AMMOTYPE = ""; MSOT_SELECTED_AMMOINDEX = -1;};
            If(count (missionNamespace getVariable [STRVAR_DO(artillery_marker),""]) == 0)then
            {
              ctrlSetText [10029, "Select your Target on Map!"];
            };
          };
   case 6:{
            //CONTROL RELOAD BUTTON
            If(!(isNull (gunner MSOT_RELOAD_ARTILLERY)))then
            {
              missionNamespace setVariable [STRVAR_DO(artillery_reload_vec),[MSOT_RELOAD_ARTILLERY],true];
              _control = ((findDisplay 36643) displayCtrl 10028);
              ctrlEnable [10032, false];
              missionNamespace setVariable [STRVAR_DO(artillery_reload_timer),true,true];
              ((missionNamespace getVariable (STRVAR_DO(artillery_reload_vec))) select 0) setVariable [STRVAR_DO(artillery_vec_inService),true,true];
              _state = [0,2] select isMultiplayer;
              _para = [MSOT_RELOAD_ARTILLERY,false];
              REMOTE_TRIEXESM(_para,usage,doService,_state);
              sleep 40;
              ["RELOAD",((missionNamespace getVariable (STRVAR_DO(artillery_reload_vec))) select 0)] call MFUNC(dlg,doAmmoUpdate);
              ((missionNamespace getVariable (STRVAR_DO(artillery_reload_vec))) select 0) setVariable [STRVAR_DO(artillery_vec_inService),false,true];
              missionNamespace setVariable [STRVAR_DO(artillery_reload_timer),false,true];
              If(count (lbSelection _control) > 0 && {count (lbSelection _control) < 2})then{ctrlEnable [10032,true];};
            };
          };
   case 7:{
            //CONTROL CHECK SWITCH
            If((_info # 2) > 0)then{
            _control = ((findDisplay 36643) displayCtrl 10028);
            _holder = missionNamespace getVariable[STRVAR_DO(artillery_resources),[]];
            private _arr = [];private _del_arr = [];
            {
              _type = [(lbText [10028,_x]),_holder] call MFUNC(dlg,getUnitTypeName);
              _ammo = [(_type select 1),false] call MFUNC(dlg,getAmmoTypes);
              private _allowed =  switch(true)do
                                  {
                                    case (isNull (gunner (_type select 1))):{false};
                                    case (((_type select 1) getVariable [STRVAR_DO(artillery_vec_inService),false])):{false};
                                    case (((_ammo select 2) select (lbCurSel 10031)) < (call compile (ctrlText 10034))):{false};
                                    default {true};
                                  };
              If(_allowed)then{_arr pushBack (_type select 1);}else{_del_arr pushBack _x;};
            }forEach (lbSelection _control);
            If(count _del_arr > 0)then{{_control lbSetSelected [_x, false];}forEach _del_arr;};
            If(count _arr > 0)then
            {
              private _chk = switch(true)do
                             {
                               case ((call compile (ctrlText 10034)) < 1):{[false,"Check Rounds per Unit"]};
                               case (count (missionNamespace getVariable [STRVAR_DO(artillery_marker),""]) == 0):{[false,"No Target Area selected!"]};
                               case (count MSOT_SELECTED_AMMOTYPE == 0):{[false,"No Artillery Ammo Type selected!"]};
                               case (!((getMarkerPos (missionNamespace getVariable [STRVAR_DO(artillery_marker),""])) inRangeOfArtillery [_arr, MSOT_SELECTED_AMMOTYPE])):{[false,"Out Of Artillery Range!"]};
                               default {[true,""]};
                             };
              If(_chk # 0)then
              {
                If(missionNamespace getVariable [STRVAR_DO(artillery_fire_timer),false]) exitWith {
                                                                                                    (_info select 0) ctrlSetChecked [(_info select 1), false];
                                                                                                    ctrlSetText [10029, "Standby! Artillery in Use!"];
                                                                                                  };

                ctrlEnable [10040, true];
                private _eta = 0;
                {_eta = _eta + (_x getArtilleryETA [(getMarkerPos (missionNamespace getVariable [STRVAR_DO(artillery_marker),""])), MSOT_SELECTED_AMMOTYPE]);}forEach _arr;
                MSOT_ETA_TIMER = (round (_eta / (count _arr)) + 10);
                ctrlSetText [10038, (str(MSOT_ETA_TIMER))];
                ctrlSetText [10036, (str ((call compile (ctrlText 10034)) * (count _arr)))];
                MSOT_ARTILLERY_UNITS = _arr;
                MSOT_ARTILLERY_ROUNDS = (call compile (ctrlText 10034));
                MSOT_ARTILLERY_TARGET = (getMarkerPos (missionNamespace getVariable [STRVAR_DO(artillery_marker),""]));
              }else{(_info select 0) ctrlSetChecked [(_info select 1), false];ctrlSetText [10029, (_chk # 1)];};


            }else{(_info select 0) ctrlSetChecked [(_info select 1), false];
                  ctrlSetText [10029, "Selected Artillery or Artillery Ammo not available!"];
                  If(lbSize 10031 > 0)then{lbClear 10031;};ctrlEnable [10039,false];lbSetCurSel [10031, -1];
                  If(count (lbSelection _control) < 1)then{ctrlEnable [10032, false];};
                 };
            }else{ctrlEnable [10040, false];ctrlSetText [10038,"0"];
                  ctrlSetText [10036,"0"];
                 };
          };
   case 8:{
            //CONTROL FIRE BUTTON
            ctrlEnable [10040, false];ctrlSetText [10029, "Call Artillery Fire!"];
            _control = ((findDisplay 36643) displayCtrl 10039);
            ctrlEnable [10028, false]; ctrlEnable [10031, false]; ctrlSetText [10034,"0"];
            If(_control ctrlChecked 0)then{_control ctrlSetChecked [0, false];};
            missionNamespace setVariable [STRVAR_DO(artillery_fire_timer),true,true];
            _state = [0,2] select isMultiplayer;
            _para = [MSOT_ARTILLERY_UNITS,MSOT_ARTILLERY_TARGET,MSOT_SELECTED_AMMOTYPE,MSOT_ARTILLERY_ROUNDS];
            REMOTE_TRIEXESM(_para,usage,useArtilleryFire,_state);
            {["UPDATE",_x,MSOT_SELECTED_AMMOINDEX,MSOT_ARTILLERY_ROUNDS] call MFUNC(dlg,doAmmoUpdate);}forEach MSOT_ARTILLERY_UNITS;
            sleep MSOT_ETA_TIMER;
            ctrlEnable [10028, true]; ctrlEnable [10031, true];
            missionNamespace setVariable [STRVAR_DO(artillery_fire_timer),false,true];
          };
};
