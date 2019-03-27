If(isMultiplayer)then{if(hasInterface) exitWith{};};
#include "msot_components.hpp"
/* --------------------------------------------------------------------------------------------------------------

Author: Fry

----------------------------------------------------------------------------------------------------------------- */
private ["_mid_pos","_mid_range","_mid_dir","_house_counter","_enemy_counter"];

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
  _mid_pos = (_x # 0);
  _mid_range = (_x # 1);
  _mid_dir = (_x # 2);

  _house_counter = [_mid_pos,200,false] call MFUNC(spawnhelp,checkHouses);
  _enemy_counter = [_mid_pos,200,MSOT_ENEMY_SIDE] call MFUNC(acm,getEnemyInZone)


 }forEach _group_poses;
};
