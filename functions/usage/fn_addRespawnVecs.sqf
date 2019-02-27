If(isMultiplayer)then{if(hasInterface) exitWith{};};
#include "msot_components.hpp"

private ["_x","_vec","_type","_pos_asl","_dir","_set_in"];

params ["_vecs_arr","_resp_time"];


If(typeName _vecs_arr isEqualTo "ARRAY" && {count _vecs_arr > 0})then
{
  {
    _vec = _x;
    _type = typeOf _vec;
    _pos_asl = GET_POSATL(_vec);
    _dir = GET_DIR(_vec);
    _set_in = [_type,_pos_asl,_dir,_resp_time];
    _vec setVariable [STRVAR_DO(vehicle_respawn_datas),_set_in,false];
    _vec addMPEventhandler ["mpkilled",{_this spawn MFUNC(system,setRespawnVecs);}];
  }forEach _vecs_arr;
};
