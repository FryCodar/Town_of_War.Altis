If(!isServer)exitWith{};
#include "msot_components.hpp"
/* --------------------------------------------------------------------------------------------------------------


Description: DONT TOUCH AND USE THIS FUNCTION - VEHCILE RESPAWN FUNCTION


Author: Fry

----------------------------------------------------------------------------------------------------------------- */
private ["_work_arr","_vec_type","_vec_pos","_vec_dir","_vec_time","_new_vec"];
params ["_vec_name"];


_work_arr = _vec_name getVariable [STRVAR_DO(vehicle_respawn_datas),[]];

If(count _work_arr > 0)then
{
  _vec_name setVariable [STRVAR_DO(vehicle_respawn_datas),nil];
  _vec_type = _work_arr select 0;_vec_pos = _work_arr select 1;_vec_dir = _work_arr select 2;_vec_time = _work_arr select 3;
  sleep _vec_time;
  deleteVehicle _vec_name;
  sleep 5;
  _new_vec = createVehicle [_vec_type,_vec_pos,[], 0, "CAN_COLLIDE"];
  SET_POSATL(_new_vec,_vec_pos,0.1); SET_DIR(_new_vec,_vec_dir);
  _new_vec setVariable [STRVAR_DO(vehicle_respawn_datas),_work_arr,false];
  _new_vec addMPEventhandler ["mpkilled",{_this spawn MFUNC(system,setRespawnVecs);}];
  If((getText(configfile >> "CfgVehicles" >> _vec_type >> "vehicleClass")) isEqualTo "Autonomous")then
  {createVehicleCrew _new_vec;};
};
