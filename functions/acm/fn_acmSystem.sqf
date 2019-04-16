If(isMultiplayer)then{if(hasInterface) exitWith{};};
#include "msot_components.hpp"
/* --------------------------------------------------------------------------------------------------------------

Author: Fry

----------------------------------------------------------------------------------------------------------------- */
private ["_group_name","_data_store","_mid_pos","_mid_range","_mid_dir","_player_counter","_house_counter","_enemy_spawn"];
params [["_info",""]];

If(missionNamespace getVariable [STRVAR_DO(acm_is_activ),false])exitWith{};
missionNameSpace setVariable [STRVAR_DO(acm_is_activ),true,true];

private _main_pos = missionNamespace getVariable [STRVAR_DO(acm_main_pos),[]];
private _group_poses = [];
If(isNil "MSOT_LAST_SITUATION")then{MSOT_LAST_SITUATION = [];};
If(count _main_pos > 0)then
{
  _group_poses = [(_main_pos # 0),(_main_pos # 1)] call MFUNC(acm,getPlayerZone);
}else{_group_poses = [(_main_pos # 0),(_main_pos # 1)] call MFUNC(acm,getPlayerZone);};

If(count _group_poses > 0)then
{
 {
  _group_name = (_x # 0);
  _data_store = (_x # 1);
  _mid_pos = (_data_store # 0);
  _mid_range = (_data_store # 1);
  _mid_dir = (_data_store # 2);

  _player_counter = [_mid_pos,_mid_range,MSOT_OWN_SIDE] call MFUNC(acm,getEnemyInZone);
  _house_counter = [_mid_pos,200,false] call MFUNC(spawnhelp,checkHouses);
  _enemy_spawn = If(([_mid_pos,200,MSOT_ENEMY_SIDE] call MFUNC(acm,getEnemyInZone)) <= _player_counter)then{true}else{false};


 }forEach _group_poses;
};
missionNameSpace setVariable [STRVAR_DO(acm_is_activ),false,true];
