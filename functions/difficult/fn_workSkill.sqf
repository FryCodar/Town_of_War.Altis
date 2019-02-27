If(isMultiplayer)then{If(!isServer) exitWith {};};

[] spawn {
#include "msot_components.hpp"
    waitUntil{(count(allPlayers - entities "HeadlessClient_F")) > 0};
    private ["_chk_arr","_groups","_sided_groups","_i","_side","_x"];
    _chk_arr = [];
    {
      If(!((side _x) In _chk_arr))then{_chk_arr pushBack (side _x)};
    }forEach (allPlayers - entities "HeadlessClient_F");

    If(count _chk_arr > 0 && count _chk_arr < 2)then
    {
      _side = _chk_arr select 0;
      _groups = allGroups;

      If(count _groups > 0)then
      {
        _sided_groups = _groups select {!((side _x) isEqualTo _side)};
        If(count _sided_groups > 0)then
        {
          {
            [_x] call MFUNC(system,setUnitSkill);
            _x setCombatMode "YELLOW";
          }forEach _sided_groups;
        };
      };
    };
};
