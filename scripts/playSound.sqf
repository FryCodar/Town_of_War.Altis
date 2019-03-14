If(isMultiplayer)then{If(!hasInterface)exitWith{};};

_this spawn {
params ["_obj_arr","_soundname","_timer","_distance"];
private _count = _timer;
While{({alive _x} count _obj_arr) > 0}do
{
  If(_count == _timer)then
  {
    {If(alive _x)then{_x say3D  [_soundname,_distance];};}forEach _obj_arr;
    _count = -1;
  };
 _count = _count + 1;
 sleep 1;
};
};
